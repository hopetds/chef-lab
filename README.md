#CHEF-LAB
#Task 7
## Task for “Chef basics”
1. Create new empty git repository on github or bitbucket.
2. Clone/init this repo o your local PC. 3 - 8 steps should be done in this cookbook. Create a new branch in this repo. All work should be done in this branch. Do not forget to commit and push your changes.
3. Download jdk cookbook from Opscode community cookbooks site
4. Create jboss cookbook and recipes using Opscode recipe DSL and resources http://docs.opscode.com/resource.html
5. Jboss cookbook should install jboss package and setup jboss server, also it should contain recipes to start/stop/restart/reload jboss service.
6. Add jdk cookbook dependency to jboss cookbook
7. Add recipes to install and configure jboss 8. Add recipe to deploy sample application http://www.cumulogic.com/download/Apps/testweb.zip
9. Recipe should download, unpack and put application jars to Jboss deploy folder. Then restart Jboss.
10. Setup new Vagrant VM install chef solo and configure knife
11. Clone git cookbooks repo to your VM and apply them to system.
12. Copy chef run output logs to your git repo commit and create Pull request to master branch.
13. Send a link to your pull request to Nikalai_Stakanov@epam.com 

## TASK steps:
## 1. Download java cookbook
## 2. Create jboss cookbook:
 - chef generate cookbook jboss
 ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task7/pics/jbossgenerate.png)
## 3. Configure java dependency
 - vim /root/cookbooks/jboss/metadata.rb
 ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task7/pics/jboss-metadata.png)
## 4. Configuring jboss /attributes/default.rb
 - vim /root/cookbooks/jboss/attributes/default.rb
 ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task7/pics/attributes.png)
## 5. Configuring Jboss /recipes/default.rb
 - vim /root/cookbooks/jboss/recipes/default.rb ---- install jboss, create user
 ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task7/pics/before-deployingapp.png)
 - vim /root/cookbooks/jboss/recipes/default.rb ----- deploy, configure jboss as a service
 ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task7/pics/undeploying-final.png)
## 6. Placing jboss.erb and jboss-conf.erb into templates folder
 - I've simply copied existing conf files
## 7. /root/.chef/solo.rb:
 ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task7/pics/solo.png)
## 8. /root/.chef/runlist.json:
 ![alt tag](hhttps://raw.githubusercontent.com/hopetds/chef-lab/task7/pics/runlist.png)
## 9. Running chef-solo:
 - chef-solo -c /root/.chef/solo.rb >>cheflog.txt
 https://github.com/hopetds/chef-lab/blob/task7/chefstartlog.txt
## 10. APP is deployed successfully:
 ![alt tag](https://raw.githubusercontent.com/hopetds/chef-lab/task7/pics/end.png)
