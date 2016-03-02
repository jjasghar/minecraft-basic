#
# Cookbook Name:: minecraft-basic
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

apt = execute 'apt-get update' do
  action :nothing
end

if 'debian' == node['platform_family']
  if !File.exist?('/var/lib/apt/periodic/update-success-stamp')
    apt.run_action(:run)
  elsif File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86_400
    apt.run_action(:run)
  end
end
case node['platform_family']
when 'debian'

  package 'default-jre'

when 'rhel', 'fedora'

  package 'java-1.6.0-openjdk'

end

directory '/usr/share/minecraft' do
  mode '0755'
  recursive true
end

remote_file '/usr/share/minecraft/minecraft_server.jar' do
  source "https://s3.amazonaws.com/Minecraft.Download/versions/#{node['minecraft_basic']['version']}/minecraft_server.#{node['minecraft_basic']['version']}.jar"
  mode '0755'
  notifies :restart, 'service[minecraft-server]'
end

bash 'get the eula made' do
  user 'root'
  cwd '/usr/share/minecraft/'
  creates 'maybe'
  code <<-EOH
    STATUS=0
    java -Xmx#{node['minecraft_basic']['max_memory']}M -Xms#{node['minecraft_basic']['min_memory']}M -jar minecraft_server.jar nogui || STATUS=1
    exit $STATUS
  EOH
end

template '/usr/share/minecraft/eula.txt' do
  source 'eula.txt.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/usr/share/minecraft/server.properties' do
  source 'server.properties.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/usr/share/minecraft/ops.txt' do
  source 'ops.txt.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

case node['platform_family']
when 'debian'

  template '/etc/init/minecraft-server.conf' do
    source 'minecraft-server.init.erb'
    owner 'root'
    group 'root'
    mode '0644'
  end

  execute 'sudo initctl reload-configuration'

when 'rhel', 'fedora'

  template '/usr/lib/systemd/system/minecraft-server.service' do
    source 'minecraft-server.service.erb'
    owner 'root'
    group 'root'
    mode '0644'
  end

end

service 'minecraft-server' do
  action [:enable, :start]
end

include_recipe "minecraft-basic::map"
