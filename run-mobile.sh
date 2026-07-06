#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8010}"

cd "$(dirname "$0")"

HOST_IP="$(
  ipconfig getifaddr en0 2>/dev/null \
    || ipconfig getifaddr en1 2>/dev/null \
    || hostname -I 2>/dev/null | awk '{print $1}' \
    || echo "YOUR_WIFI_IP"
)"

echo "Serving this folder on your local Wi-Fi network."
echo "Open this on your phone: http://${HOST_IP}:${PORT}"
echo "Press Ctrl+C here to stop the server."
echo

python3 -m http.server "$PORT" --bind 0.0.0.0
