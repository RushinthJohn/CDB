#
# Cookbook:: CDB
# Recipe:: pc2
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# 2> PC2-Slave

directory '/data/config/config-b' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

directory '/data/shard0/rs1' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

directory '/data/shard1/rs1' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

execute 'Starting Config Server B' do
  command 'mongod --replSet cfgst --logpath "cfg-b.log" --dbpath /data/' /
          'config/config-b --port 57025 --fork --configsvr'
  not_if 'netstat -l | grep mongodb-57025'
  # notifies :run, 'execute[Starting MongoD Shard-0 Replica-1]', :immediately
end

execute 'Starting MongoD Shard-0 Replica-1' do
  command 'mongod --replSet s0 --logpath "s0-r1.log" --dbpath /data/' /
          'shard0/rs1 --port 37025 --fork --shardsvr'
  not_if 'netstat -l | grep mongodb-37025'
  # notifies :run, 'execute[Starting MongoD Shard-1 Replica-1]', :immediately
  # action :nothing
end

execute 'Starting MongoD Shard-1 Replica-1' do
  command 'mongod --replSet s1 --logpath "s1-r1.log" --dbpath /data/' /
          'shard1/rs1 --port 47025 --fork --shardsvr'
  not_if 'netstat -l | grep mongodb-47025'
  # action :nothing
end
