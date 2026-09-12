#!/bin/sh

PORT=${PORT:-8080}
echo "PORT: $PORT"

cat > /tmp/config.json << EOF
{
  "log": {"loglevel": "debug"},
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
        "wsSettings": {"path": "/ws-3n8v5x1z"}
      },
      "sniffing": {
        "enabled": true,
        "destOverride": ["http", "tls"],
        "routeOnly": false
      }
    }
  ],
  "outbounds": [
    {"tag": "direct", "protocol": "freedom", "settings": {}}
  ]
}
EOF

exec /usr/local/bin/xray run -c /tmp/config.json
