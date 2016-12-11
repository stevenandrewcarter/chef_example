default['nginx']['repo'] = 'http://plinmgr1v.standardbank.co.za/repo/software/nginx/'
#What the servername will be: e.g. example.com
default['nginx']['serverurl'] = 'example.com'

#What url you want to proxy: e.g. http://localhost:5601
default['nginx']['backendurl'] = 'http://localhost:3001'

default['nginx']['user'] = 'nginx'
default['nginxy']['gid'] = nil
default['nginx']['uid'] = nil

# SSL Attributes
default['nginx']['use_ssl'] = false
default['nginx']['crt'] = ''
default['nginx']['key'] = ''