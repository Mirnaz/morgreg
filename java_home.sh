#!/usr/bin/env bash

function validate_java_home {
    if [ -z ${JAVA_HOME} ]
    then
        echo "it's not present"
    else
        if [ ! -e ${JAVA_HOME} ]
        then
            echo "It's present"
        fi
    fi
}

if [ ! -e ${YOUR_FILE_NAME_CONTAINING_JAVA_HOME} ]
then
     JAVA_HOME_CANDIDATES=$(find /usr -name 'jdk1.6*')
     echo "Found the following candidates for JAVA_HOME, reply with the one you want then press return"
     echo ""
     echo $JAVA_HOME_CANDIDATES
     read USER_SUBMITTED_JAVA_HOME
     echo "You chose $USER_SUBMITTED_JAVA_HOME"
     JAVA_HOME=${USER_SUBMITTED_JAVA_HOME}
else
    . ${YOUR_FILE_NAME_CONTAINING_JAVA_HOME}
fi
validate_java_home
export ${JAVA_HOME}
