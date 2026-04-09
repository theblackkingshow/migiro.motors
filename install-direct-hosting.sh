#!/usr/bin/env bash
set -euo pipefail

SITE_DIR="/var/www/migiromotors"
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

sudo mkdir -p "$SITE_DIR"
sudo cp "$PROJECT_DIR/index.html" "$SITE_DIR/index.html"
sudo cp "$PROJECT_DIR/schema.sql" "$SITE_DIR/schema.sql"
sudo cp "$PROJECT_DIR/migiromotors-apache.conf" /etc/apache2/sites-available/migiromotors.conf

sudo a2dissite 000-default.conf || true
sudo a2ensite migiromotors.conf
sudo systemctl reload apache2

echo "Direct hosting is configured."
echo "Open: http://102.0.7.24"
echo "After DNS is added, open: http://migiromotors.com.au"
