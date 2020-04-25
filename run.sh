#!/bin/sh

ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2
curl -negotiate -u admin:admin -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" | python -mjson.tool | tee typedefs.log

#define type
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" -d "@./typedef-node.json" | python -mjson.tool | tee typedef-node.log

#define file
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" -d "@./typedef-file.json" | python -mjson.tool | tee typedef-file.log

#define kafka wit schema
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" -d "@./typedef-kafka_with_schema.json" | python -mjson.tool | tee typedef-kafka_with_schema.log

#define python process
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" -d "@./typedef-python_process.json" | python -mjson.tool | tee typedef-python_process.log

#define infrastructure entities
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/entity/bulk" -d "@./infrastructure-entities.json" | python -mjson.tool | tee infrastructure-entities.log

#define ingestion dataset
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/entity/bulk" -d "@./news-ingestion-dataset.json" | python -mjson.tool | tee news-ingestion-dataset.log

#define process
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/entity/bulk" -d "@./news-ingestion-process.json" | python -mjson.tool | tee news-ingestion-process.log
