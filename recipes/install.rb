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
        action  :install
    end
end

# php.ini
node['php']['sapi'].each_pair do |sapi, value|
    if node['php']['sapi'][sapi]['enable']
        package node['php']['sapi'][sapi]['package'] do
            action  :install
        end

        template "#{node['php']['sapi'][sapi][:ini_path]}/php.ini" do
            action    :create
            source    'php.ini.erb'
            mode      '0644'
            owner     'root'
            group     'root'
            variables (node['php']['sapi'][sapi]['ini'])
        end
    end
end