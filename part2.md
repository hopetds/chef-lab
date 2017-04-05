### Part2
### Configuring Ports
## Steps: 
 - cd /opt/chef
 - wget https://github.com/chef-cookbooks/firewall/archive/master.zip
 - unzip master.zip
 - cd master
 - berks init
 - berks install
 - berks package
 - tar -xf cookbooks-1491400802.tar.gz -C /root/
 - cd /root/cookbooks/firewall
 - vim /root/cookbooks/chef_nginx/attributes/default.rb
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/8081.png)
 - vim /root/.chef/solo.rb
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/master/runlist.png)
### Configuring firewall rules:
 - vim /root/cookbooks/firewall/recipes/default.rb
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/attributes.png)
### Adding recipe in solo conf:
   - Rerun chef to apply changes: $chef-solo -c /root/.chef/solo.rb
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/curlfromvg.png)
### Nginx is available
  - Curl localhost : $curl -IL localhost:8081
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/curlfromvg.png)
 - Curl from hostmachine : $curl -IL 192.168.10.15:8081
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/curllocalhost.png)
