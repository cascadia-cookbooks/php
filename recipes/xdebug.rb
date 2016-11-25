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
end
