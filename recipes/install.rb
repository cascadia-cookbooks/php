if node['platform'] == 'ubuntu' && node['platform_version'] == '14.04'
    # add ppa
    # add new repo for PHP7
    apt_repository 'ondrej-php' do
      uri          'ppa:ondrej/php'
      distribution node['lsb']['codename']
    end

    # purge php 5
    execute 'purge-php5' do
      command 'apt-get autoremove -y --purge php5-*'
    end
end

php_packages = node['php']['packages']

php_packages.each do |pkg|
    package pkg do
        action :install
    end
end

# php.ini
template "#{node['php']['ini_path']}/php.ini" do
    action    :create
    source    'php.ini.erb'
    mode      '0644'
    owner     'root'
    group     'root'
    variables (
        node['php']['ini']
    )
end

# opcache.ini
template "#{node['php']['module_ini_path']}/11-opcache.ini" do
    action    :create
    source    'opcache.ini.erb'
    mode      '0644'
    owner     'root'
    group     'root'
    variables (
        node['php']['ini']['opcache']
    )
end

# session.ini
template "#{node['php']['module_ini_path']}/12-session.ini" do
    action    :create
    source    'session.ini.erb'
    mode      '0644'
    owner     'root'
    group     'root'
    variables (
        node['php']['ini']['session']
    )
end

# PHP 7 fpm service
service node['php']['fpm_service_name'] do
    action  [:enable, :start]
end
