#!/bin/bash
for i in `set | grep --color=never OS_ | awk -F '=' '{print $1}'`; do unset $i; done
export OS_USERNAME=veko0623
# echo "Input password for OpenStack user veko0623:"
export OS_PASSWORD=$1
export OS_TENANT_NAME=veko0623
export OS_PROJECT_NAME=veko0623
export OS_PROJECT_DOMAIN_NAME=netcracker
export OS_USER_DOMAIN_NAME=netcracker
export OS_AUTH_URL=https://zephyr02cn.netcracker.com:5000
export OS_IDENTITY_API_VERSION=3
export OS_INTERFACE=public
export OS_ENDPOINT_TYPE=publicURL
export OS_CACERT=cloudca.pem
