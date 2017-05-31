if node['php']['ext']['xdebug']['enable']
    package node['php']['ext']['xdebug']['package'] do
        action :install
    end

    template "#{node['php']['sapi']['fpm']['module_ini_path']}/#{node['php']['ext']['xdebug']['config_filename']}" do
        action :create
        backup false
        force_unlink true
        manage_symlink_source false
        group  "root"
        owner  "root"
        mode   0644
        source "xdebug.ini.erb"
        variables (
            node['php']['ext']['xdebug']['directives']
        )
        notifies    :run, "execute[enable_php_xdebug]", :immediate
        notifies    :restart, "service[#{node['php']['sapi']['fpm']['fpm_service_name']}]", :delayed
    end

    # Enable mod and restart PHPfpm
    execute 'enable_php_xdebug' do
        action      :nothing
        user        'root'
        command     'phpenmod xdebug'
        only_if     'which phpenmod'
    end
end
