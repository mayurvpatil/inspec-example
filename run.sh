#!/bin/sh

bundle install &&
inspec exec . -t winrm://${SERVERSPEC_USER}@${SERVERSPEC_IP} --password "${SERVERSPEC_PASSWORD}" --format html >> reports/result.html
inspec exec . -t winrm://${SERVERSPEC_USER}@${SERVERSPEC_IP} --password "${SERVERSPEC_PASSWORD}" --format json-rspec >> reports/results.json

