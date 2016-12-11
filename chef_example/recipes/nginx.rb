group node['nginx']['user'] do
  gid node['nginx']['gid']
  action :create
  system false
end

user node['nginx']['user'] do
  comment 'Nginx User'
  uid     node['nginx']['uid']
  gid     node['nginx']['user']
  action  :create
  system false
end

# cookbook_file '/etc/yum.repos.d/nginx.repo' do
#   source 'nginx.repo'
#   owner 'root'
#   group 'root'
#   mode 00755
#   action :create
# end

package 'epel-release' do
  action :install
end

#Installs nginx
package 'nginx' do
  action :install
end

#Creates config for proxy service
template '/etc/nginx/conf.d/default.conf' do
  source 'default.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  notifies :restart, 'service[nginx]', :immediately
end

#Starts the nginx service if it's not already started
service 'nginx' do
  action :start
end
