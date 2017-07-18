# fpm.conf
template "#{node['php']['sapi']['fpm']['ini_path']}/php-fpm.conf" do
    action    :create
    source    'php-fpm.conf.erb'
    mode      '0644'
    owner     'root'
    group     'root'
    variables (
        node['php']['sapi']['fpm']['conf']
    )
    notifies :restart, "service[#{node['php']['sapi']['fpm']['fpm_service_name']}]", :delayed
end

# create pool conf directory if it does not exist
directory "#{node['php']['sapi']['fpm']['fpm_pool_conf_path']}" do
    action :create
    mode   '0755'
    owner  'root'
    group  'root'
end

# loop through pools, create conf files
node['php']['sapi']['fpm']['conf']['pools'].each_pair do |pool, value|
    # pool confs
    template "Pool conf" do
        action    :create
        source    'php-fpm-pool.conf.erb'
        mode      '0644'
        owner     'root'
        group     'root'
        path      "#{node['php']['sapi']['fpm']['fpm_pool_conf_path']}/#{pool}.conf"
        variables (
            value
        )
        notifies :restart, "service[#{node['php']['sapi']['fpm']['fpm_service_name']}]", :delayed
    end
end

# opcache.ini
template "#{node['php']['sapi']['fpm']['module_ini_path']}/11-opcache.ini" do
    action    :create
    source    'opcache.ini.erb'
    mode      '0644'
    owner     'root'
    group     'root'
    variables (
        node['php']['sapi']['fpm']['opcache']['ini']
    )
    notifies :restart, "service[#{node['php']['sapi']['fpm']['fpm_service_name']}]", :delayed
end

# session.ini
template "#{node['php']['sapi']['fpm']['module_ini_path']}/12-session.ini" do
    action    :create
    source    'session.ini.erb'
    mode      '0644'
    owner     'root'
    group     'root'
    variables (
        node['php']['sapi']['fpm']['session']['ini']
    )
    notifies :restart, "service[#{node['php']['sapi']['fpm']['fpm_service_name']}]", :delayed
end

# PHP 7 fpm service
service node['php']['sapi']['fpm']['fpm_service_name'] do
    action [:enable, :start]
end
