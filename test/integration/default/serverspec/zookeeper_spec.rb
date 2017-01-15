require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/local/zookeeper/bin/zkServer.sh') do
  it { should exist }
  it { should be_file }
end

describe file('/usr/local/zookeeper/conf/zoo.cfg') do
  it { should exist }
  it { should be_file }
end