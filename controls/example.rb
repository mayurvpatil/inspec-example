# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

title 'sample section'

# you can also use plain tests
describe file('/tmp') do
  it { should be_directory }
end

describe file('/etc/passwd') do
  it { should be_file }
end


# you add controls here
control 'tmp-1.0' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Create /tmp directory'             # A human-readable title
  desc 'An optional description...'
  describe file('/tmp') do                  # The actual test
    it { should be_directory }
  end
end

describe service('crontab') do 
  it { should be_running }
end
describe service('crond') do 
  it { should be_running }
end
describe service('cron') do 
  it { should be_running }
end

=begin
services = yaml(content: inspec.profile.file('services.yml')).params
#puts "------------------------------------------------------"
#puts services["services"]
#puts "------------------------------------------------------"
services["services"].each do |s|
  describe service(s) do
    it { should be_running }
  end


end
=end

=begin
#---- for windows----------------------
describe file('C:\Windows') do
  it { should be_directory }
end

describe service('Dnscache') do
    it { should be_running }
end
#--------------------------------------
=end