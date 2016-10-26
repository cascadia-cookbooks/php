# attribution where it is due: https://github.com/rjocoleman/chef-php-redis

# download remote archive based on redis version
remote_file "#{Chef::Config[:file_cache_path]}/phpredis.tar.gz" do
  source "https://github.com/phpredis/phpredis/archive/#{node['php']['ext']['redis']['version']}.tar.gz"
  not_if 'php -m | grep redis'
  only_if 'which phpize'
end

# extract and build the PHP extension
bash 'make & install phpredis' do
    cwd Chef::Config[:file_cache_path]
    code <<-EOF
    tar zxf phpredis.tar.gz
    cd "phpredis-#{node['php']['ext']['redis']['version']}"
    phpize
    ./configure
    make && make install
    EOF
    not_if 'php -m | grep redis'
    only_if 'which phpize'
end

# create redis extension conf file
file "#{node['php']['ext']['conf_path']}/redis.ini" do
    owner 'root'
    group 'root'
    mode '0644'
    content 'extension=redis.so'
    not_if 'php -m | grep redis'
end

# Enable mod and restart PHPfpm
execute 'enable_php_redis' do
    action      :run
    user        'root'
    command     'phpenmod redis'
    notifies    :restart, "service[#{node['php']['sapi']['fpm']['fpm_service_name']}]", :delayed
end