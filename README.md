# inspec-example
sample example for inspec

# How to run this automation code ?

## To Test Linux Instance

inspec exec https://github.com/tahirstamboli/inspec-example -t ssh://user@host --password 'password' --format html >> test_result.html

## To Test Windows Instance

inspec exec https://github.com/tahirstamboli/inspec-example -t winrm://user@host --password 'password' --format html >> test_result.html
