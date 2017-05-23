#
# Cookbook:: CDB
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

cookbook_file '/etc/yum.repos.d/mongodb-org-3.4.repo' do
  source 'mongodb-org-3.4.repo'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

package 'mongodb-org' do
  version nil
  action :install
end
