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

    it 'creates config-a data directory' do
      expect(chef_run).to create_directory('/data/config/config-a').with(
        owner:   'user',
        group:  'group',
        mode:  '0755'
      )
    end

    it 'creates s0-r0 data directory' do
      expect(chef_run).to create_directory('/data/shard0/rs0').with(
        owner:   'user',
        group:  'group',
        mode:  '0755'
      )
    end

    it 'creates s1-r0 data directory' do
      expect(chef_run).to create_directory('/data/shard1/rs0').with(
        owner:   'user',
        group:  'group',
        mode:  '0755'
      )
    end

    it 'starts Config Server A' do
      expect(chef_run).to run_execute('mongod --replSet cfgst --logpath "cfg' /
      '-a.log" --dbpath /data/config/config-a --port 57020 --fork --configsvr')
    end

    it 'starts MongoD Shard-0 Replica-0' do
      expect(chef_run).to run_execute('mongod --replSet s0 --logpath ' /
      '"s0-r0.log" --dbpath /data/shard0/rs0 --port 37020 --fork --shardsvr')
    end

    it 'starts MongoD Shard-1 Replica-0' do
      expect(chef_run).to run_execute('mongod --replSet s1 --logpath ' /
      '"s1-r0.log" --dbpath /data/shard1/rs0 --port 47020 --fork --shardsvr')
    end
  end
end
