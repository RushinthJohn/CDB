#
# Cookbook:: cdb
# Recipe:: pc1
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#1> PC1-Master

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
  not_if 'pstree | grep mongod'
  notifies :run, 'execute[Starting MongoD Shard-0 Replica-0]', :immediately
end

execute 'Starting MongoD Shard-0 Replica-0' do
  command 'mongod --replSet s0 --logpath "s0-r0.log" --dbpath /data/shard0/rs0 --port 37017 --fork --shardsvr'
  not_if 'pstree | grep mongod'
  notifies :run, 'execute[Starting MongoD Shard-1 Replica-0]', :immediately
  action :nothing
end

execute 'Starting MongoD Shard-1 Replica-0' do
  command 'mongod --replSet s1 --logpath "s1-r0.log" --dbpath /data/shard1/rs0 --port 47017 --fork --shardsvr'
  not_if 'pstree | grep mongod'
  action :nothing
end
