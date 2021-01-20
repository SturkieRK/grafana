#!/bin/bash

# Command Line Opts
GRAFANA_VERSION="7.3.1"
GRAFANA_PORT="3000"

local DOWNLOAD_URL="https://dl.grafana.com/oss/release/grafana_${GRAFANA_VERSION}_amd64.deb"
sudo apt-get install -y adduser libfontconfig
wget "${DOWNLOAD_URL}"
sudo dpkg -i "grafana_${GRAFANA_VERSION}_amd64.deb"
systemctl daemon-reload
