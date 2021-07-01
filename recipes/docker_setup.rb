docker_service 'default' do 
  action [:create, :start]
end
#Add the ubuntu user to the docker group 
group 'docker' do
 members 'ubuntu' 
 append true 
 action :modify
end

