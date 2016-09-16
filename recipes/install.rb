if node['platform'] == 'ubuntu' && node['platform_version'] == '14.04'
    # add ppa
    # add new repo for PHP7
    apt_repository 'ondrej-php' do
      uri          'ppa:ondrej/php'
      distribution node['lsb']['codename']
    end

    # purge php 5
    execute 'purge-php5' do
      command 'sudo apt-get autoremove -y --purge php5-*'
    end
end

php_packages = node.default['php']['packages'][node.default['php']['package_manager']]

php_packages.each do |pkg|
    package pkg do
        action :install
    end
end

# php.ini
template '/etc/php/7.0/fpm/php.ini' do
    action    :create
    source    'php.ini.erb'
    mode      '0644'
    owner     'root'
    group     'root'
    variables (
        node.default['php']['ini']
    )
end

# opcache.ini
template '/etc/php/7.0/fpm/conf.d/11-opcache.ini' do
    action    :create
    source    'opcache.ini.erb'
    mode      '0644'
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
    mode      '0644'
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
