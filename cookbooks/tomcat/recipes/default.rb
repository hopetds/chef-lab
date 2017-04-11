#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'java'
include_recipe 'httpd'
yum_package 'tomcat' do
  action :install
end
remote_file '/opt/testweb.zip' do
  source "http://www.cumulogic.com/download/Apps/testweb.zip"
  action :create_if_missing
end
execute 'unzip' do
  command "unzip -o /opt/testweb.zip"
  not_if { ::File.exist? ("/opt/testweb")}
end
#moving war to deploy, as a best practice instead of using copy
execute 'deploy' do
  command "mv /opt/testweb/testweb.war /var/lib/tomcat/webapps/"
  not_if { ::File.exist? ("/var/lib/tomcat/webapps/testweb.war")}
end
service 'tomcat' do
  supports :start => true, :stop => true, :restart => true, :status => true
  action [ :enable, :start]
end
