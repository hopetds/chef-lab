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
 - vim /root/cookbooks/firewall/attributes/default.rb
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/master/runlist.png)
 - vim /root/.chef/solo.rb
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/master/runlist.png)
 - vim /root/cookbooks/firewall/recipes/default.rb
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/master/runlist.png)
 - Curl localhost
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/master/runlist.png)
 - Curl from hostmachine
   ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/master/runlist.png)
