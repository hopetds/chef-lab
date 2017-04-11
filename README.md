#CHEF-LAB
## Taks steps
### 1. tomcat cookbook generate
 - chef generate cookbook tomca
### 2. Java cookbook is used from task7
### 3. Create 2 runlists
 - runlist that enables maintenance page
 https://github.com/hopetds/chef-lab/blob/exam/.chef/runlist-disable.json
 - runlist that enables default testweb app
 https://github.com/hopetds/chef-lab/blob/exam/.chef/runlist-disable.json
### 4. Creating additional solo.rb's:
 - solo for enabling maintenance
 https://github.com/hopetds/chef-lab/blob/exam/solo-maintenance-enable.rb
 - solo for disabling maintenance page
 https://github.com/hopetds/chef-lab/blob/exam/solo-maintenance-disable.rb
### 5. Configuring tomcat and deploying app
 - with included httpd recipe:
 https://github.com/hopetds/chef-lab/blob/exam/cookbooks/tomcat/recipes/default.rb
### 6. Httpd config:
 https://github.com/hopetds/chef-lab/blob/exam/cookbooks/httpd/recipes/default.rb
### 7. RB for maintenance
 - enabling:
 https://github.com/hopetds/chef-lab/blob/exam/cookbooks/httpd/recipes/enable_maintenance_mode.rb
 - disabling: 
 https://github.com/hopetds/chef-lab/blob/exam/cookbooks/httpd/recipes/disable_maintenance_mode.rb
### 8. Template for maintenance:
 - conf:
 https://github.com/hopetds/chef-lab/blob/exam/cookbooks/httpd/templates/maintenanceconf.erb
 - html:
 https://github.com/hopetds/chef-lab/blob/exam/cookbooks/httpd/templates/maintenancepage.erb
