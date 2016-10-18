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

sapis = ['cgi', 'cli', 'fpm']

# php.ini
sapis.each do |sapi|
    if node['php']['sapi'][sapi]
        value = node['php']['sapi'][sapi]
        if node['php']['sapi'][sapi][:enable]
            package value['package'] do
                action :install
            end
            template "php.ini" do
                action    :create
                source    'php.ini.erb'
                path      lazy {
                    "#{node['php']['sapi'][sapi][:ini_path]}/php.ini"
                }
                mode      '0644'
                owner     'root'
                group     'root'
                variables (
                    lazy {
                        node['php']['sapi'][sapi]['ini']
                    }
                )
            end
        end
    end
end