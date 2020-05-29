#!/bin/sh

bundle install &&
inspec exec . -t ssh://${SERVERSPEC_USER}@${SERVERSPEC_IP} --key-files "${SERVERSPEC_SSH_KEY}" --format html >> reports/result.html
inspec exec . -t ssh://${SERVERSPEC_USER}@${SERVERSPEC_IP} --key-files "${SERVERSPEC_SSH_KEY}" --format json-rspec >> reports/results.json

