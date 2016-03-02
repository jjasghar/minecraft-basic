#
# Cookbook Name:: minecraft-basic
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'minecraft-basic::map' do
  context 'When all attributes are default, on an Ubuntu Trusty node' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run
    end

    describe 'sets up a web server' do
      it 'ensures nginx is installed' do
        expect(chef_run).to install_package('nginx')
      end

      it 'ensure nginx is running' do
        expect(chef_run).to enable_service('nginx')
        expect(chef_run).to start_service('nginx')
      end

      it 'defines a site' do
        expect(chef_run).to create_template('/etc/nginx/sites-enabled/map.conf')
      end

      it 'removes the default site' do
        expect(chef_run).to delete_file('/etc/nginx/sites-enabled/default')
      end

      it 'creates the directory from which the map will be served' do
        expect(chef_run).to create_directory('/srv/minecraft/map')
      end
    end

    describe 'sets up the map renderer' do
      it 'adds the mapcrafter apt repo to sources' do
        expect(chef_run).to add_apt_repository('mapcrafter')
        .with(uri: 'http://packages.mapcrafter.org/ubuntu')
      end

      it 'ensures mapcrafter is installed' do
        expect(chef_run).to install_package('mapcrafter')
      end

      it 'configures mapcrafter to render a map of the world' do
        expect(chef_run).to create_template('/srv/minecraft/mapcrafter.conf')
      end

      it 'schedules the map to be rendered' do
        expect(chef_run).to create_cron_d('render_minecraft_world_map')
      end
    end

  end

  context 'When all attributes are default, on a RedHat node' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'redhat', version: '7.0')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run
    end

    it 'does not do a thing' do
      expect(chef_run).not_to add_apt_repository('mapcrafter apt repo')
    end
  end
end
