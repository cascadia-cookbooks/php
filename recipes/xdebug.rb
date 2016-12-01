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
        variables (
            node['php']['xdebug']['directives']
        )
        notifies    :run, "execute[enable_php_redis]", :immediate
        notifies    :restart, "service[#{node['php']['sapi']['fpm']['fpm_service_name']}]", :delayed
    end

    # Enable mod and restart PHPfpm
    execute 'enable_php_xdebug' do
        action      :run
        user        'root'
        command     'phpenmod xdebug'
        only_if     'which phpenmod'
    end
end
