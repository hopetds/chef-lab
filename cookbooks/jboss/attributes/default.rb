default['jboss']['path'] = '/opt'
default['jboss']['home'] = '/opt/jboss-as-7.1.1.Final'
default['jboss']['testapp_dir'] = "#{node['jboss']['home']}/standalone/deployments"
default['jboss']['url'] = "http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.zip"
default['jboss']['app_url'] = "http://www.cumulogic.com/download/Apps/testweb.zip"
default['jboss_user'] = 'JBOSS'
default['jboss_group'] = 'JBOSS'

