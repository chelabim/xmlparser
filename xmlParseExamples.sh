#! /bin/bash

CMT="
#                             (xml parser solution for UNIX/Linux)
#   Author: Mohammed CHELABI
#   Create date:  2013
#   Version: 1.0
#   ------------
# This script provide you some examples of how we can use the functions 
# from the xml Library 'lib_xpfunctions'.
"

# Include the library 'lib_xpfunctions'
. ./lib_xpfunctions


echo -ne "\n${CMT}\n\n"

echo -ne "1) \033[4mThe function 'getAllNode()' can extract all node from 'devices.xml'\033[0m."
echo -ne "\n\t-> Devices: \c"
NODES=`getAllNode devices.xml`; echo ${NODES}

echo ""

echo -ne "2) \033[4mThe function 'getNodeCount()' can counts the number of all node from 'devices.xml'\033[0m."
echo -ne "\n\t-> Count of devices: \c"
getNodeCount devices.xml

echo ""

echo -ne "3) \033[4mThe function 'getAllApplication()' can extract all application from 'applications.xml'\033[0m."
echo -ne "\n\t-> Applications: \c"
NODES=`getAllApplication applications.xml`; echo ${NODES}
echo ""



echo "Example of use:"



for i in `getAllNode devices.xml`
do
    echo -en "Hosname: $i \c"
    ENVIR=`getEnvByNode "$i" devices.xml`
    for e in `echo $ENVIR`
    do
        APPLI=`getAllAppliByEnv $e applications.xml`
        echo -en "Environment: $e \c"
        echo -en "-> App: `echo ${APPLI:-NULL}` \c"
        echo -en "# \c"
    done
    echo "|"
done
