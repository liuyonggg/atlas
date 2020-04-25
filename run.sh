#!/bin/sh

ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2
curl -negotiate -u admin:admin -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs"

#define type
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" -d "@./typedef-node.json"

#define file
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" -d "@./typedef-file.json"

#define kafka wit schema
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" -d "@./typedef-kafka_with_schema.json"

#define python process
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/types/typedefs" -d "@./typedef-python_process.json"

#define infrastructure entities
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/entity/bulk" -d "@./infrastructure-entities.json"

#define ingestion dataset
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/entity/bulk" -d "@./news-ingestion-dataset.json"

#define process
curl -negotiate -u admin:admin -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' "$ATLAS_BASE_URL/entity/bulk" -d "@./news-ingestion-process.json"
