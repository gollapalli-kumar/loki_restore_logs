package main

import (
	"context"
	"flag"
	"fmt"

	"github.com/grafana/loki/v3/pkg/storage"
	"github.com/grafana/loki/v3/pkg/storage/stores/shipper/indexshipper"
	"github.com/grafana/loki/v3/pkg/storage/stores/shipper/indexshipper/index"
	"github.com/grafana/loki/v3/pkg/storage/stores/shipper/indexshipper/tsdb"
	util_log "github.com/grafana/loki/v3/pkg/util/log"
	"github.com/grafana/loki/v3/tools/tsdb/helpers"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/common/model"
	"github.com/prometheus/prometheus/model/labels"
)

// Use below command To run a index analyzer
// BUCKET=19883 DIR=/tmp/loki-index-analysis go run loki_decrypting_S3_logs.go
func analyze(indexShipper indexshipper.IndexShipper, tableName string, tenants []string) error {
	var (
		seriesRes []tsdb.Series
		chunkRes  []tsdb.ChunkRef
	)
	for _, tenant := range tenants {
		err := indexShipper.ForEach(
			context.Background(),
			tableName,
			tenant,
			index.ForEachIndexCallback(func(isMultiTenantIndex bool, idx index.Index) error {
				if isMultiTenantIndex {
					return nil
				}
				casted := idx.(*tsdb.TSDBFile)
				seriesRes = seriesRes[:0]
				chunkRes = chunkRes[:0]
				res, err := casted.Series(
					context.Background(),
					tenant,
					model.Earliest,
					model.Latest,
					seriesRes, nil,
					labels.MustNewMatcher(labels.MatchEqual, "", ""),
				)
				if err != nil {
					return err
				}
				fmt.Println(res)
				chunkRes, err := casted.GetChunkRefs(
					context.Background(),
					tenant,
					model.Earliest,
					model.Latest,
					chunkRes, nil,
					labels.MustNewMatcher(labels.MatchEqual, "", ""),
				)
				fmt.Println(chunkRes)
				if err != nil {
					return err
				}
				return nil
			}),
		)
		if err != nil {
			return err
		}
	}
	return nil
}

func main() {
	conf, _, bucket, err := helpers.Setup()
	helpers.ExitErr("setting up", err)
	_, overrides, clientMetrics := helpers.DefaultConfigs()
	flag.Parse()
	periodCfg, tableRange, tableName, err := helpers.GetPeriodConfigForTableNumber(bucket, conf.SchemaConfig.Configs)
	helpers.ExitErr("find period config for bucket", err)
	objectClient, err := storage.NewObjectClient(periodCfg.ObjectType, conf.StorageConfig, clientMetrics)
	helpers.ExitErr("creating object client", err)
	shipper, err := indexshipper.NewIndexShipper(
		periodCfg.IndexTables.PathPrefix,
		conf.StorageConfig.TSDBShipperConfig,
		objectClient,
		overrides,
		nil,
		tsdb.OpenShippableTSDB,
		tableRange,
		prometheus.WrapRegistererWithPrefix("loki_tsdb_shipper_", prometheus.DefaultRegisterer),
		util_log.Logger,
	)
	helpers.ExitErr("creating index shipper", err)
	tenants, err := helpers.ResolveTenants(objectClient, periodCfg.IndexTables.PathPrefix, tableName)
	helpers.ExitErr("resolving tenants", err)
	err = analyze(shipper, tableName, tenants)
	helpers.ExitErr("analyzing", err)
}
