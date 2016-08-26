php_packages = %w(
    php7.0-cli
    php7.0-common
    php7.0-curl
    php7.0-fpm
    php7.0-gd
    php7.0-intl
    php7.0-json
    php7.0-mbstring
    php7.0-mcrypt
    php7.0-opcache
    php7.0-soap
    php7.0-xmlrpc
    php7.0-zip
    php-redis
)

php_packages.each do |pkg|
    package pkg do
        action :install
    end
end

# PHP 7 fpm service
service 'php7.0-fpm' do
    action      :nothing
end
