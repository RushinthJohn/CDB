#
# Cookbook:: CDB
# Recipe:: Master-Initialize
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#1> PC1-Master

cookbook_file '/tmp/shard0.sh' do
  source 'shard0.sh'
  owner 'root'
  group 'root'
  mode '0755'
  #notifies :run, 'execute[Set members and initaite Shard 1]', :immediately
  action :create
end

execute 'Set members and initaite Shard 0' do
  command 'bash < shard0.sh'
  cwd '/tmp'
  action :run
end

cookbook_file '/tmp/shard1.sh' do
  source 'shard1.sh'
  owner 'root'
  group 'root'
  mode '0755'
  #notifies :run, 'execute[Set members and initaite Shard 1]', :immediately
  action :create
end

execute 'Set members and initaite Shard 1' do
  command 'bash < shard1.sh'
  cwd '/tmp'
  action :run
end

cookbook_file '/tmp/config.sh' do
  source 'config.sh'
  owner 'root'
  group 'root'
  mode '0755'
  #notifies :run, 'execute[Set members and initaite Config Server]', :immediately
  action :create
end

execute 'Set members and initaite Config Server' do
  command 'bash < config.sh'
  cwd '/tmp'
  action :run
end
