#
# Cookbook:: lb_docker_host
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
apt_update
package 'net-tools'
directory '/home/ubuntu/loadbalancer'
all_docker_hosts = search('node', 'policy_name:web_docker_host')
template '/home/ubuntu/loadbalancer/haproxy.cfg' do 
  source 'haproxy.cfg.erb'
  variables(:web_host_list => all_docker_hosts) 
  force_unlink true
end
include_recipe 'lb_docker_host::docker_setup'

