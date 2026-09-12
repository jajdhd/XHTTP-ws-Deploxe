#!/bin/sh

PORT=${PORT:-8080}

cat > /tmp/config.json << EOF
{
  "log": {"loglevel": "warning"},
  "inbounds": [
    {
      "tag": "ws-in",
      "port": $PORT,
      "protocol": "vless",
      "settings": {
        "clients": [
          {"id": "8f3a2b1c-9d4e-4f6a-b7c8-1e2d3f4a5b6c", "flow": ""}
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "websocket",
        "security": "none",
        "wsSettings": {
          "path": "/ws-3n8v5x1z"
        }
      }
    }
  ],
  "outbounds": [
    {"tag": "direct", "protocol": "freedom", "settings": {}}
  ]
}
EOF

echo "===================="
echo "Xray Config Loaded (WebSocket only)"
echo "PORT: $PORT"
echo "UUID: 8f3a2b1c-9d4e-4f6a-b7c8-1e2d3f4a5b6c"
echo "WS Path: /ws-3n8v5x1z"
echo "===================="

exec /usr/local/bin/xray run -c /tmp/config.json
