#
# Cookbook:: CDB
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'CDB::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates mongod repo file with attributes' do
      expect(chef_run).to create_cookbook_file('/etc/yum.repos.d/mongodb-org- /
      3.4.repo').with(
        owner:   'root',
        group:  'root',
        mode: '0644'
      )
    end

    it 'installs mongodb' do
      expect(chef_run).to install_package 'mongodb-org'
    end
  end
end
