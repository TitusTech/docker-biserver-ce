#!/bin/bash

display() {
    echo
    echo ============================================================
    echo NEXT:
    echo -e "\033[01;34m$(pwd)\033[00m$ $@"
    echo
}

confirm() {
    display "$@"

    read -r -p"Run? [Y/n] ";echo;echo
    if [[ $REPLY =~ ^[Yy]?$ ]]
    then
        echo -e "Running... \033[01;34m$(pwd)\033[00m$ $@"
        echo
        run "$@"
    fi
}

disprun() {
    display "$@"
    run "$@"
}

run() {
        exitOnError='true'
        if [[ $1 == 'DONTEXITONERROR' ]]
        then
            exitOnError='false'
            echo "Exit on error? ${exitOnError}"
            shift;
        fi

        "$@"

        rc=$?
        echo
        echo ============================================================

        if [[ $rc != 0 ]]
        then
            echo
            echo "ERROR CODE ${rc} WHEN EXECUTING IN `pwd` THE COMMAND: $@"
            echo
            if [[ ${exitOnError} == 'true' ]]
            then
                exit $rc
            fi
        fi
}

disprun docker build --tag taurus227/pentaho-server-ce:9.1 .
disprun docker container run --detach --name pentaho --publish 8080:8080 taurus227/pentaho-server-ce:9.1
