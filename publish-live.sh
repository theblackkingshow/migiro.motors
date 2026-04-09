#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8000}"
TOKEN="${PINGGY_TOKEN:-}"

if ! curl -fsS "http://127.0.0.1:${PORT}" >/dev/null 2>&1; then
  echo "Starting local server on port ${PORT}..."
  nohup python3 -m http.server "${PORT}" >/tmp/migiro-http.log 2>&1 &
  sleep 2
fi

if [[ -n "$TOKEN" ]]; then
  echo "Starting authenticated Pinggy Pro tunnel on port ${PORT}..."
  exec ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 -p 443 -R0:localhost:${PORT} "${TOKEN}@pro.pinggy.io"
else
  echo "No PINGGY_TOKEN found. Starting free public tunnel instead..."
  exec ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 -p 443 -R0:localhost:${PORT} qr@a.pinggy.io
fi
