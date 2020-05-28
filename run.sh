#!/bin/sh

bundle install &&
inspec exec inspec-workshop -t ssh://${SERVERSPEC_USER}@${SERVERSPEC_IP} --key-files "${SERVERSPEC_SSH_KEY}" --format html >> report/results.html
inspec exec inspec-workshop -t ssh://${SERVERSPEC_USER}@${SERVERSPEC_IP} --key-files "${SERVERSPEC_SSH_KEY}" --format json-rspec >> report/results.json

