docker_service 'default' do 
  action [:create, :start]
end
#Add the ubuntu user to the docker group 
group 'docker' do
 members 'ubuntu' 
 append true 
 action :modify
end
docker_image 'haproxy' do 
  action :pull
end
docker_container 'haproxy' do
 repo 'haproxy'
 volumes ['/home/ubuntu/loadbalancer/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg']
 port '80:80' 
 action :run 
 read_timeout 60 
 write_timeout 60
end
