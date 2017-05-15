#
# Cookbook:: CDB
# Recipe:: pc4
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#4> MongoS Server

execute 'Starting mongos on a standard port' do
  command 'mongos --logpath "mongos-1.log" --configdb cfgst/192.168.1.134:57020,192.168.1.135:57025,192.168.1.136:57030 --fork'
  cwd '/tmp'
  action :run
end

cookbook_file '/tmp/mongos.sh' do
  source 'mongos.sh'
  owner 'root'
  group 'root'
  mode '0755'
  #notifies :run, 'execute[Set members and initaite Shard 1]', :immediately
  action :create
end

execute 'Add and enable Shards' do
  command 'bash < mongos.sh'
  cwd '/tmp'
  action :run
end
