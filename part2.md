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
### Configuring iptables:
 - vim /root/cookbooks/firewall/recipes/default.rb
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/attributes.png)
 - chef-solo -c /root/.chef/solo.rb
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/firewallddddd.png)
  - Curl localhost
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/curlfromvg.png)
 - Curl from hostmachine
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task6/pics/curllocalhost.png)
