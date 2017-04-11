#recipe that disables maintenance page
execute 'maintenance' do
  command "rm -rf /etc/httpd/conf.d/maintenance.conf"
end
template '/etc/httpd/conf.d/vhost.conf' do
  source 'vhost.erb'
  not_if { ::File.exist? ("/etc/httpd/conf.d/vhost.conf")}
end
#apply changes
service 'httpd' do
  action :restart
end
