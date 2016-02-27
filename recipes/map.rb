#
# Cookbook Name:: minecraft-basic
# Recipe:: map
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

if 'debian' == node['platform_family']
  package 'nginx'

  service 'nginx' do
    action [:enable, :start]
  end

  directory '/srv/minecraft/map' do
    recursive true
  end

  template '/etc/nginx/sites-enabled/map.conf' do
    source 'map_site.conf.erb'
    variables({
      fqdn: node['fqdn'],
      web_map_dir: '/srv/minecraft/map',
    })
    notifies :restart, 'service[nginx]'
  end

  file '/etc/nginx/sites-enabled/default' do
    action :delete
    notifies :restart, 'service[nginx]'
  end

  apt_repository 'mapcrafter' do
    uri "http://packages.mapcrafter.org/#{node['platform']}"
    distribution node['lsb']['codename']
    components ['main']
    key "http://packages.mapcrafter.org/#{node['platform']}/keyring.gpg"
  end

  package 'mapcrafter'

  template '/srv/minecraft/mapcrafter.conf' do
    source 'mapcrafter.conf.erb'
    variables({
      world_name: 'Chef Minecraft',
      world_path: '/usr/share/minecraft/world',
      render_path: '/srv/minecraft/map',
    })
  end

  cron_d 'render_minecraft_world_map' do
    minute  11
    command 'mapcrafter -c /srv/minecraft/mapcrafter.conf'
  end
end
