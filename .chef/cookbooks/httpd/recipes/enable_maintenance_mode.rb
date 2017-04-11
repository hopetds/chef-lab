#recipe that enables mainenance page
template '/var/www/html/maintenance.html' do
  source 'maintenancepage.erb'
  not_if { ::File.exist? ("/var/www/html/maintenance.html")}
end
template '/etc/httpd/conf.d/maintenance.conf' do
  source 'maintenanceconf.erb'
  variables ({
    :maintenance_file => node['httpd']['maintenance_file'],
  })
  not_if { ::File.exist? ("/etc/httpd/conf.d/maintenance.conf")}
end
execute 'maintenance' do
  command "rm -rf /etc/httpd/conf.d/vhost.conf"
end
#apply changes
service 'httpd' do
  action :restart
end
