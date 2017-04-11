#
# Cookbook:: httpd
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
yum_package 'httpd' do
  action :install
end
template '/etc/httpd/conf.d/vhost.conf' do
  source 'vhost.erb'
end
service 'httpd' do
  supports :start => true, :stop => true, :restart => true, :status => true
  action [ :enable, :start]
end
