# inspec-example
sample example for inspec

# How to run this automation code ?

## Linux

inspec exec https://github.com/tahirstamboli/inspec-example -t ssh://user@host --password 'password' --format html >> test_result.html

## Windows

inspec exec https://github.com/tahirstamboli/inspec-example -t winrm://user@host --password 'password' --format html >> test_result.html
