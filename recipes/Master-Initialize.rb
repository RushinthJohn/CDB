#
# Cookbook:: cdb
# Recipe:: Master-Initialize
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#1> PC1-Master

execute 'Set members and initaite Shard 0' do
  command 'command mongo --port 37017 < /tmp/initailize.txt'
  action :nothing
end

cookbook_file '/tmp/initailize.txt' do
  source 'initailize.txt'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :run, 'execute[Set members and initaite Shard 0]', :immediately
  action :create
end
=begin
template '/tmp/initailize.txt' do
  source 'initailize.txt'
  owner 'root'
  group 'root'
  mode '0755'
#  notifies :run, 'execute[Set members and initaite Shard 0]', :immediately
  action :create_if_missing
end
=end
=begin
execute 'Set members and initaite Shard 0' do
  command mongo --port 37017 << 'EOF'
config = { _id: "s0", members:[
          { _id : 0, host : "192.168.1.127:37017" },
          { _id : 1, host : "192.168.1.130:37018" },
          { _id : 2, host : "192.168.1.128:37019" }]};
rs.initiate(config)
EOF
end

execute 'Set members and initaite Shard 1' do
  command mongo --port 47017 << 'EOF'
config = { _id: "s1", members:[
          { _id : 0, host : "192.168.1.127:47017" },
          { _id : 1, host : "192.168.1.130:47018" },
          { _id : 2, host : "192.168.1.128:47019" }]};
rs.initiate(config)
EOF
end

execute 'Set members and initaite Config Server' do
  command mongo --port 57040 << 'EOF'
config = { _id: "cfgst", members:[
          { _id : 0, host : "192.168.1.127:57040" },
          { _id : 1, host : "192.168.1.130:57041" },
          { _id : 2, host : "192.168.1.128:57042" }]};
rs.initiate(config)
EOF
end
=end
