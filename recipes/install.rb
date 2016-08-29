php_packages = node.default['php']['packages']

php_packages.each do |pkg|
    package pkg do
        action :install
    end
end

# php.ini
template '/etc/php/7.0/fpm/php.ini' do
    action    :create
    source    'php.ini.erb'
    mode      '0440'
    owner     'root'
    group     'root'
    variables (
        node.default['php']['ini']
    )
end

# opcache.ini
template '/etc/php/7.0/fpm/conf.d/06-opcache.ini' do
    action    :create
    source    'opcache.ini.erb'
    mode      '0440'
    owner     'root'
    group     'root'
    variables (
        node.default['php']['opcache']['ini']
    )
end

# session.ini
template '/etc/php/7.0/fpm/conf.d/11-session.ini' do
    action    :create
    source    'session.ini.erb'
    mode      '0440'
    owner     'root'
    group     'root'
    variables (
        node.default['php']['session']['ini']
    )
end

# PHP 7 fpm service
service 'php7.0-fpm' do
    action  :nothing
end
