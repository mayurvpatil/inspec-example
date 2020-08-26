# InSpec: Inspect Your Infrastructure

InSpec is an open-source testing framework for infrastructure with a human- and machine-readable language for specifying compliance, security and policy requirements.

```ruby
# Disallow insecure protocols by testing

describe package('telnetd') do
  it { should_not be_installed }
end

describe inetd_conf do
  its("telnet") { should eq nil }
end
```
InSpec makes it easy to run your tests wherever you need. More options are found in our [CLI docs](https://www.inspec.io/docs/reference/cli/).


# Features

- Built-in Compliance: Compliance no longer occurs at the end of the release cycle
- Targeted Tests: InSpec writes tests that specifically target compliance issues
- Metadata: Includes the metadata required by security and compliance pros
- Easy Testing: Includes a command-line interface to run tests quickly

# Installation

## Ruby dependency
```bash
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.2
sudo apt-get install ruby2.2-dev

gem environment
```
## Build-Essential Package  

build-essential is a package which contains stuff needed for building software. (make, gcc ..)
```bash
sudo apt-get install build-essential
```

## Inspec Gem installation
```bash
sudo gem install inspec

sudo gem install inspec-bin

gem list
```


# How to run this automation code ?

## To Test Linux Instance

inspec exec https://github.com/tahirstamboli/inspec-example -t ssh://user@host --password 'password' --format html >> test_result.html

## To Test Windows Instance

inspec exec https://github.com/tahirstamboli/inspec-example -t winrm://user@host --password 'password' --format html >> test_result.html

## Instructions to run with TestNow

Test linux server with key

Pre-script 

```curl -sSL https://get.rvm.io -o rvm.sh
cat rvm.sh | bash -s stable --rails
               source /usr/local/rvm/scripts/rvm
               rvm install ruby-2.5.7
               rvm use ruby-2.5.7
```

Command to run 
```
bash run.sh
```

Post Script 
```
echo "Executing PostScript"
```

Output Directory
```
inspec-example/reports
```

report file 
```
summary.json
```
