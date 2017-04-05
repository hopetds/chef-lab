#CHEF-LAB
---

### 1. Task steps:
 - mkdir /opt/chef
 - cd /opt/chef
 - sudo wget https://packages.chef.io/files/stable/chef/12.19.36/el/6/chef-12.19.36-1.el6.x86_64.rpm
 - sudo wget https://packages.chef.io/files/stable/chefdk/1.2.22/el/6/chefdk-1.2.22-1.el6.x86_64.rpm

## Installing:
 - sudo rpm -i chef-12.19.36-1.el6.x86_64.rpm 
 - sudo rpm -i chefdk-1.2.22-1.el6.x86_64.rpm

## Downloading required cookbooks:
 - sudo wget https://github.com/chef-cookbooks/chef_nginx/archive/master.zip
 - sudo wget https://github.com/chef-cookbooks/iptables/archive/master.zip
 
## Unzip:
 - yum install unzip -y
 - sudo unzip master #nginx
 - sudo unzip master1 #iptables
## Berks:
 - cd /opt/chef-nginx
 - berks init
 - berks install
 - berks package
 - sudo tar -xf cookbooks-1491390564.tar.gz -C /root/
## Same berks step for iptables:
 --//--
 - sudo tar -xf cookbooks-1491390564.tar.gz -C /root/cookbooks
## Configuring knife:
 ### - mkdir /root/.chef/solo.db
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/solo.png)
## Configuring runlist.json
 ### - vim /root/.chef/runlist.json
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/master/runlist.png)
## Note that  recipe names must be identical to /root/cookbooks/%cookbooksname%
 - "recipe[chef_nginx::default]" - /root/cookbooks/chef_nginx
 - "recipe[iptables::default]" - /root/cookbooks/iptables
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/cooks.png)
---
## Run chef with solo conf:
 - chef-solo -c /root/.chef/solo.rb
### Check if nginx is working: $curl -IL localhost
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/curl.png)
