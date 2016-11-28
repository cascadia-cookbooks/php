if node['php']['xdebug']['enabled']
    package node['php']['xdebug']['package'] do
        action :install
    end

    template node['php']['xdebug']['config_file'] do
        source "xdebug.ini.erb"
        group  "root"
        owner  "root"
        mode   0644
        backup false
        action :create
    end

    # Enable mod and restart PHPfpm
    execute 'enable_php_xdebug' do
        action      :run
        user        'root'
        command     'phpenmod xdebug'
        notifies    :restart, "service[#{node['php']['sapi']['fpm']['fpm_service_name']}]", :delayed
    end
end
