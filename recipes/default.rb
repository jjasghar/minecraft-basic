#
# Cookbook Name:: minecraft-basic
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute 'sudo apt-get update'

package 'default-jre'

directory '/usr/share/minecraft' do
  mode '0755'
  recursive true
end

remote_file '/usr/share/minecraft/minecraft_server.jar' do
  source "https://s3.amazonaws.com/Minecraft.Download/versions/#{node[:minecraft_basic][:version]}/minecraft_server.#{node[:minecraft_basic][:version]}.jar"
  mode '0755'
end

bash "get the eula made" do
  user "root"
  cwd "/usr/share/minecraft/"
  creates "maybe"
  code <<-EOH
    STATUS=0
    java -Xmx#{node[:minecraft_basic][:max_memory]}M -Xms#{node[:minecraft_basic][:min_memory]}M -jar minecraft_server.jar nogui || STATUS=1
    exit $STATUS
  EOH
end

template "/usr/share/minecraft/eula.txt" do
  source "eula.txt.erb"
  owner "root"
  group "root"
  mode "0644"
end

template "/etc/init/minecraft-server.conf" do
  source "minecraft-server.init.erb"
  owner "root"
  group "root"
  mode "0644"
end

execute 'sudo initctl reload-configuration'

execute 'sudo start minecraft-server'
