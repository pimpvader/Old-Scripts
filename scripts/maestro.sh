#!/bin/bash 

# 
# If $1 is set for maestro host use it, otherwise use default # MAESTRO_HOST="maestro.dotomi.com" 
MAESTRO_VERSION="v4" 
if [ -n "${1}" ]; then 
    MAESTRO_HOST="${1}" 

    # 
    # If $2 is set for the version of maestro use it, otherwise use default 
    # 
    if [ -n "${2}" ]; then 
        MAESTRO_VERSION="${2}" 
    fi 
fi 

BASE_PATH="http://${MAESTRO_HOST}/${MAESTRO_VERSION}" 
READY="${BASE_PATH}/dm/admin/statistics_ready.do" 

if [ "YES" == $(curl --silent ${READY} | head -n 1) ]; then 
    CACHE_BASE="${BASE_PATH}/rest/cache" 
    CACHES=$(curl --silent "${CACHE_BASE}" | grep "item identifier=" | grep -o '"[a-z]*_*[a-z]*_*[a-z]*_*[a-z]"' | grep -o 
'[a-z]*_*[a-z]*_*[a-z]*_*[a-z]') 

    for cache in $CACHES; do 
        if [[ "${cache}" != "servers" ]] && [[ "${cache}" != "ap_skus" 
]] ; then 
            STATUS=$(curl --silent "${CACHE_BASE}/${cache}/status") 

            # 
            # Skip any caches that do not have a status response 
            # 
            if [ -n "${STATUS}" ]; then 
                COUNT=$(echo "${STATUS}" | grep "<count>" | grep -o 
"[0-9]*") 
                LAST_UPDATE=$(echo "${STATUS}" | grep "<lastUpdate>" | grep -o "[0-9]*") 
                NOW="`date +%s`000" 
                let "DIFF = $NOW - $LAST_UPDATE" 
                let "ELAPSED_TIME = $DIFF / 1000 / 60" 
                echo "cache: '${cache}', count: '${COUNT}', last update: 
'${LAST_UPDATE}', now - last update: '${DIFF}', time since last update 
(mins): ${ELAPSED_TIME}": 
            fi 
        fi 
    done 
else 
    echo "Could not validate that the server is up and running" 
fi 

