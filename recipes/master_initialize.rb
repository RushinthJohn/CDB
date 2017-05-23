#
# Cookbook:: CDB
# Recipe:: master_initialize
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# 1> PC1-Master

template '/tmp/shard0.sh' do
  source 'shard0.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

execute 'Set members and initaite Shard 0' do
  command 'bash < shard0.sh'
  cwd '/tmp'
  action :run
end

template '/tmp/shard1.sh' do
  source 'shard1.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

execute 'Set members and initaite Shard 1' do
  command 'bash < shard1.sh'
  cwd '/tmp'
  action :run
end

template '/tmp/config.sh' do
  source 'config.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

execute 'Set members and initaite Config Server' do
  command 'bash < config.sh'
  cwd '/tmp'
  action :run
end
