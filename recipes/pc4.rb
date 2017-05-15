#
# Cookbook:: CDB
# Recipe:: pc4
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#4> MongoS Server

template '/tmp/mongos.sh' do
  source 'mongos.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

execute 'Add and enable Shards' do
  command 'bash < mongos.sh'
  cwd '/tmp'
  action :run
end
