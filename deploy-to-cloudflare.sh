#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="${PROJECT_NAME:-migiromotors-site}"

if ! npx --yes wrangler@3 whoami >/dev/null 2>&1; then
  echo "Cloudflare login required..."
  npx --yes wrangler@3 login
fi

npx --yes wrangler@3 pages project create "$PROJECT_NAME" --production-branch main || true
npx --yes wrangler@3 pages deploy . --project-name "$PROJECT_NAME"

echo

echo "Next: in Cloudflare Pages, add the custom domain migiromotors.com.au"
