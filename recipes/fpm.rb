package node['php']['fpm-package'] do
    action :install
end

# fpm.conf
template "#{node['php']['ini_path']}/php-fpm.conf" do
    action    :create
    source    'php-fpm.conf.erb'
    mode      '0644'
    owner     'root'
    group     'root'
    variables (
        node['php']['ini']['fpm']
    )
end

# loop through pools, create conf files
node['php']['ini']['fpm']['pools'].each_pair do |pool, value|
    # pool confs
    template "#{node['php']['fpm_pool_conf_path']}/#{pool}.conf" do
        action    :create
        source    'php-fpm-pool.conf.erb'
        mode      '0644'
        owner     'root'
        group     'root'
        variables (
            value
        )
    end
end

# PHP 7 fpm service
service node['php']['fpm_service_name'] do
    action  [:enable, :start]
end
