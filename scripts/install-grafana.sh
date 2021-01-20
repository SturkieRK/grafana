#!/bin/bash

# Command Line Opts
GRAFANA_VERSION="7.3.1"
GRAFANA_PORT="3000"

# Parameters
ADMIN_PWD="admin"

# Install Grafana
install_grafana()
{
    local DOWNLOAD_URL="https://dl.grafana.com/oss/release/grafana_${GRAFANA_VERSION}_amd64.deb"
    sudo apt-get install -y adduser libfontconfig
    wget "${DOWNLOAD_URL}"
    sudo dpkg -i "grafana_${GRAFANA_VERSION}_amd64.deb"
    systemctl daemon-reload
}

start_grafana()
{
    systemctl start grafana-server
    sudo systemctl enable grafana-server.service
}

# Install the Azure Data Explorer Datasource
install_azure_data_explorer_plugin()
{
    grafana-cli plugins install grafana-azure-data-explorer-datasource
    systemctl restart grafana-server
}

# Update the grafana passord of the admin account
# configure_admin_password()
# {
#     sed -i "s/;admin_password = admin/admin_password = ${ADMIN_PWD}/" /etc/grafana/grafana.ini
# }

install_grafana
# configure_admin_password
start_grafana
install_azure_data_explorer_plugin
