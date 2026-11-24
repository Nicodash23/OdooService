#!/usr/bin/env bash
# Update an Odoo module, then restart Odoo.
# Usage: ./update.sh [module] [database]   (defaults: testModule, odooTestDb)
set -e
cd "$(dirname "$0")"   # so docker compose finds compose.yaml from any location

docker compose exec odoo sh -c 'odoo -c /etc/odoo/odoo.conf --db_host="$HOST" --db_user="$USER" --db_password="$PASSWORD" -d "$2" -u "$1" --stop-after-init --no-http' _ "${1:-testModule}" "${2:-odooTestDb}"
docker compose restart odoo
