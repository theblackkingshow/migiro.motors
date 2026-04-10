#!/usr/bin/env bash
set -euo pipefail

rm -rf dist
mkdir -p dist

cp index.html dist/
cp -R admin dist/
cp -R assets dist/
cp -R data dist/

echo "Prepared Render static site in ./dist"
find dist -maxdepth 2 -type f | sort
