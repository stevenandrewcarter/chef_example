package 'gcc-c++' do
  action :install
end

package 'make' do
  action :install
end

execute 'node_config' do
  command 'curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -'
end

package 'nodejs' do
  action :install
end

cookbook_file '/tmp/demo_server.js' do
  source 'demo_server.js'
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

execute 'node_config' do
  command 'sudo setsebool httpd_can_network_connect 1'
  action :run
end

template 'demo_server' do
  source 'server.erb'
  path '/etc/init.d/demo_server'
  owner 'root'
  group 'root'
  mode 00755
  notifies :restart, 'service[demo_server]', :delayed
end

service 'demo_server' do
  action :start
end