#!/bin/sh

# نادیده گرفتن PORT و استفاده از 8080
PORT=8080
echo "Forcing PORT to: $PORT"

cat > /tmp/config.json << EOF
{
  "log": {"loglevel": "warning"},
  "inbounds": [
    {
      "tag": "xhttp-in",
      "port": $PORT,
      "protocol": "vless",
      "settings": {
        "clients": [
          {"id": "8f3a2b1c-9d4e-4f6a-b7c8-1e2d3f4a5b6c", "flow": ""}
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "xhttp",
        "security": "none",
        "xhttpSettings": {
          "path": "/xhttp-7k9m2p4q",
          "mode": "packet-up"
        }
      }
    }
  ],
  "outbounds": [
    {"tag": "direct", "protocol": "freedom", "settings": {}}
  ]
}
EOF

exec /usr/local/bin/xray run -c /tmp/config.json
