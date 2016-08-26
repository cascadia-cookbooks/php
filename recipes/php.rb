php_packages = node['default']['php']['packages']

php_packages.each do |pkg|
    package pkg do
        action :install
    end
end

# PHP 7 fpm service
service 'php7.0-fpm' do
    action      :nothing
end
