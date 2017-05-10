#
# Cookbook:: cdb
# Recipe:: pc2
#
# Copyright:: 2017, The Authors, All Rights Reserved.

directory '/data/config/config-a' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

directory '/data/shard0/rs0' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

directory '/data/shard1/rs0' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

execute 'Starting Config Server A' do
  command 'mongod --replSet cfgst --logpath "cfg-a.log" --dbpath /data/config/config-a --port 57040 --fork --configsvr'
end

execute 'Starting MongoD Shard-0 Replica-0' do
  command 'mongod --replSet s0 --logpath "s0-r0.log" --dbpath /data/shard0/rs0 --port 37017 --fork --shardsvr'
end

execute 'Starting MongoD Shard-1 Replica-0' do
  command 'mongod --replSet s1 --logpath "s1-r0.log" --dbpath /data/shard1/rs0 --port 47017 --fork --shardsvr'
end
