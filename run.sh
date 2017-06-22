#!/bin/sh

echo "run.sh triggered by REAN Test"
echo "Running Actual inspec automation code using run.sh"
#echo "user : ${SPEC_USER}"
#echo "host : ${SPEC_HOST_NAME}"
#echo "password : ${SPEC_PASSWORD}"

echo "installing inspec gem"
gem install inspec

inspec exec inspec-workshop -t winrm://${SPEC_USER}@${SPEC_HOST_NAME} --password "${SPEC_PASSWORD}" --format html >> report/results.html
#inspec exec inspec-workshop --backend "winrm" --host "${SPEC_HOST_NAME}" --user "${SPEC_USER}" --password "${SPEC_PASSWORD}" --format html >> results.html
inspec exec inspec-workshop -t winrm://${SPEC_USER}@${SPEC_HOST_NAME} --password "${SPEC_PASSWORD}" --format json >> report/results.json

