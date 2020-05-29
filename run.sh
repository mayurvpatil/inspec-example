#!/bin/sh

bundle install &&
inspec exec . -t ssh://${INSPEC_USER}@${INSPEC_IP} --key-files "${INSPEC_SSH_KEY}" --format html >> reports/result.html
inspec exec . -t ssh://${INSPEC_USER}@${INSPEC_IP} --key-files "${INSPEC_SSH_KEY}" --format json-rspec >> reports/results.json

