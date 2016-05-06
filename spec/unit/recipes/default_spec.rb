#
# Cookbook Name:: minecraft-basic
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'minecraft-basic::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'should run apt-get update' do
      pending 'I dont know how to test this :(  '
      expect(chef_run).to run_execute('apt-get update')
    end

    it 'creates a directory /usr/share/minecraft' do
      expect(chef_run).to create_directory('/usr/share/minecraft')
    end

    describe 'the Minecraft server JAR' do
      it 'is retrieved and placed in service directory' do
        expect(chef_run).to create_remote_file('/usr/share/minecraft/minecraft_server.jar')
      end

      it 'triggers a service restart when it changes' do
        expect(chef_run.remote_file('/usr/share/minecraft/minecraft_server.jar'))
          .to notify('service[minecraft-server]').to(:restart)
      end
    end

    it 'runs a bash script get the eula made' do
      expect(chef_run).to run_bash('get the eula made')
    end

    it 'creates a template /usr/share/minecraft/eula.txt with the default action' do
      expect(chef_run).to create_template('/usr/share/minecraft/eula.txt')
    end

    it 'creates a template /usr/share/minecraft/server.propertieswith the default action' do
      expect(chef_run).to create_template('/usr/share/minecraft/server.properties')
    end
  end
end
