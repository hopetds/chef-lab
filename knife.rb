current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "ikhamiakou"
client_key               "#{current_dir}/ikhamiakou.pem"
chef_server_url          "https://epplkraw0381t1.budapest.epam.com/organizations/ikhamiakoulab"
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:editor] = "vim"
