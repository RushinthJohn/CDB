#
# Cookbook:: cdb
# Recipe:: pc4
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#4> MongoS Server

execute 'Starting mongos on a standard port' do
  command 'mongos --logpath "mongos-1.log" --configdb cfgst/192.168.1.127:57040,192.168.1.130:57041,192.168.1.128:57042 --fork'
end

execute 'Add and enable Shards' do
  command 'mongos --logpath "mongos-1.log" --configdb cfgst/192.168.1.127:57040,192.168.1.130:57041,192.168.1.128:57042 --fork'
end
