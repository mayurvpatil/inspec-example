#!/bin/sh

bundle install &&
inspec exec inspec-workshop -t winrm://${SPEC_USER}@${SPEC_HOST_NAME} --password "${SPEC_PASSWORD}" --format html >> report/results.html
inspec exec inspec-workshop -t winrm://${SPEC_USER}@${SPEC_HOST_NAME} --password "${SPEC_PASSWORD}" --format json-rspec >> report/results.json

