#
# Cookbook:: CDB
# Recipe:: pc3
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# 3> PC3-Slave

directory '/data/config/config-c' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

directory '/data/shard0/rs2' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

directory '/data/shard1/rs2' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

execute 'Starting Config Server C' do
  command 'mongod --replSet cfgst --logpath "cfg-c.log" --dbpath /data/' /
          'config/config-c --port 57030 --fork --configsvr'
  not_if 'netstat -l | grep mongodb-57030'
  # notifies :run, 'execute[Starting MongoD Shard-0 Replica-2]', :immediately
end

execute 'Starting MongoD Shard-0 Replica-2' do
  command 'mongod --replSet s0 --logpath "s0-r2.log" --dbpath /data/' /
          'shard0/rs2 --port 37030 --fork --shardsvr'
  not_if 'netstat -l | grep mongodb-37030'
  # notifies :run, 'execute[Starting MongoD Shard-1 Replica-2]', :immediately
  # action :nothing
end

execute 'Starting MongoD Shard-1 Replica-2' do
  command 'mongod --replSet s1 --logpath "s1-r2.log" --dbpath /data/' /
          'shard1/rs2 --port 47030 --fork --shardsvr'
  not_if 'netstat -l | grep mongodb-47030'
  # action :nothing
end
