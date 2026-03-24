#!/bin/bash

docker compose cp ../../examples/with-postgres/medicare/superset/MedicareQCDashboard.json superset:/tmp/MedicareQCDashboard.json
docker compose exec superset superset import_dashboards --path /tmp/MedicareQCDashboard.json --username admin
docker compose -f docker-compose-superset.yml restart superset superset-worker
