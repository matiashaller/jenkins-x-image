#!/bin/bash
# Author: Sharad Chhetri
# Description: Update all Jenkins plugin
# Version 1.0

_JENKINS_URL=http://localhost:8080
_JENKINS_USER=admin
_JENKINS_PASSWD=Formedai@456

java -jar ./jenkins-cli.jar -s "$_JENKINS_URL" -auth "$_JENKINS_USER:_JENKINS_PASSWD" -noKeyAuth list-plugins|  grep -e ')$' | awk '{ print $1 }'| while read _UPDATE_LIST;
do 
java -jar jenkins-cli.jar -s "$_JENKINS_URL" -auth "$_JENKINS_USER:_JENKINS_PASSWD" -noKeyAuth install-plugin "$_UPDATE_LIST";
done

java -jar jenkins-cli.jar -s "$_JENKINS_URL" -auth "$_JENKINS_USER:_JENKINS_PASSWD" -noKeyAuth safe-restart;
