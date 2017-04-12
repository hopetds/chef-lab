#
#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright 2017, EPAM_LAB
#
# All rights reserved - Do Not Redistribute
# ILYA_KHAMIAKOU
#
#including recipes
include_recipe 'java'
#creating user and group
group node['jboss_group'] do
  action :create
end
user node['jboss_user'] do
  group node['jboss_group']
  manage_home true
  home '/home/jboss'
  action :create
end
#downloading jboss
remote_file '/opt/jboss-as-7.1.1.Final.zip' do
  source node['jboss']['url']
  owner node['jboss_user']
  group node['jboss_group']
  action :create_if_missing
#  not_if { ::File.file?("/opt/jboss-current/jboss-5.1.0.GA.zip")}
end
#downloading  test app
remote_file '/opt/testweb.zip' do
  source node['jboss']['app_url']
  action :create_if_missing
end
#unzipping jboss source
execute 'unzip' do
  command "unzip -o /opt/jboss-as-7.1.1.Final.zip -d #{node['jboss']['path']}"
  not_if { ::File.exist?("#{node['jboss']['home']}")}
end
#hotdeploying app
execute 'unzipapp' do
  command "unzip -o /opt/testweb.zip -d #{node['jboss']['testapp_dir']}"
  not_if { ::File.exist? ("#{node['jboss']['testapp_dir']}/hudson")}
end
#permissions
execute 'perms' do
  command "chown -R #{node['jboss_user']}:#{node['jboss_group']} /opt/jboss-as-7.1.1.Final/"
end
#preparing for start
execute 'create folder' do
  command "mkdir -p /etc/jboss-as/"
end
#copying jboss conf
template '/etc/jboss-as/jboss-as.conf' do
  source 'jboss_conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    :jboss_user => node['jboss_user'],
  })
  not_if { ::File.exists? ("/etc/jboss-as/jboss-as.conf")}
end
#copying initsh
template '/etc/init.d/jboss' do
  source 'jboss.erb'
  mode 0775
  owner 'root'
  group 'root'
  variables({
    :jboss_home => node['jboss']['home'],
  })
  not_if { ::File.exist? ("/etc/init.d/jboss")}
end

#changing hudson xml
template "#{node['jboss']['home']}/standalone/deployments/hudson/hudson.xml" do  source "hudson.erb"
  variables ({
  'engine' => data_bag_item('hudzon_app', 'hudson')['engine']
  })
end
  
#service jboss
service 'jboss' do
  supports :start => true, :stop => true, :restart => true, :status => true
  action [ :enable, :start]
end
