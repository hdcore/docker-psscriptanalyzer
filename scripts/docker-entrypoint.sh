#!/bin/sh

# Author: Danny
# Version GIT: 2021-07-05 21:10

# docker-entrypoint.sh 
# script who is launched at startup of the container

# Define special colors
CRED="\e[31m"
CGREEN="\e[32m"
CNORMAL="\e[0m"

# Start
echo -e "== ${CGREEN}Start entrypoint ${0}${CNORMAL} =="

# Echo buildversion
. show-imagedetails.sh

# End
echo -e "== ${CGREEN}End entrypoint ${0}${CNORMAL} =="

# Execute docker CMD
exec "$@"