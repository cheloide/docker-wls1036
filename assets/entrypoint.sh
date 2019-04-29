#!/bin/bash

DOMAIN_PATH="/opt/oracle/wls1036/user_projects/domains/base_domain"

function startWLS() {
    $DOMAIN_PATH/bin/startWebLogic.sh &
}

function stopWLS() {
    echo "SIGTERM Detected, stopping Weblogic Server 10.3.6"
    $DOMAIN_PATH/bin/stopWebLogic.sh
    exit 0
}

trap 'stopWLS' SIGTERM
startWLS

while true; do :; done