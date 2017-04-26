# set os specific attributes
case node['platform']
    when 'ubuntu'
        # extensions to activate
        # php7.0-common provides iconv http://packages.ubuntu.com/xenial/php7.0-iconv
        # php7.0-xml provides xml, xsl, DOM, SimpleXML

        default['php']['ext']['conf_path'] = '/etc/php/7.0/mods-available'

        # Note similar package names do not necessarily denote the same provided extensions for some meta packages like php7.0-common.
        default['php']['packages'] = %w(
            php7.0-dev
            php7.0-bcmath
            php7.0-common
            php7.0-curl
            php7.0-gd
            php7.0-intl
            php7.0-json
            php7.0-mbstring
            php7.0-mcrypt
            php7.0-mysql
            php7.0-opcache
            php7.0-soap
            php7.0-xml
            php7.0-zip
        )

    when 'centos'

        default['php']['ext']['conf_path'] = '/etc/php.d'

        # Note similar package names do not necessarily denote the same provided extensions for some meta packages like php70u-common.
        default['php']['packages'] = %w(
            gcc
            php70u-devel
            php70u-bcmath
            php70u-common
            php70u-gd
            php70u-intl
            php70u-json
            php70u-mbstring
            php70u-mcrypt
            php70u-pdo
            php70u-mysqlnd
            php70u-opcache
            php70u-soap
            php70u-xml
        )
end

# install php sapis
default['php']['sapi']['cli']['enable'] = true
default['php']['sapi']['fpm']['enable'] = true

# default php extension values
default['php']['ext']['xdebug']['enable'] = false
