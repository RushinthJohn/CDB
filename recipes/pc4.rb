#
# Cookbook:: cdb
# Recipe:: pc4
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#4> MongoS Server

execute 'Starting Config Server C' do
  command 'mongos --logpath "mongos-1.log" --configdb cfgst/192.168.1.113:57040,192.168.1.114:57041,192.168.1.115:57042 --fork'
end
