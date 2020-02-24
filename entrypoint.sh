#!/bin/bash
export APP_PATH=$1
echo "Creating DD AGENT HOST ENV VAR"
export DD_AGENT_HOST=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo ${DD_AGENT_HOST}
echo "Starting .Net Application"
echo $APP_PATH
dotnet ${APP_PATH}