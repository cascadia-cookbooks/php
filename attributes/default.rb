# extensions to activate
default['php']['packages'] = %w(
    php7.0-bcmath
    php7.0-cli
    # php7.0-common provides iconv http://packages.ubuntu.com/xenial/php7.0-iconv
    php7.0-common
    php7.0-curl
    php7.0-fpm
    php7.0-gd
    php7.0-intl
    php7.0-json
    php7.0-mbstring
    php7.0-mcrypt
    php7.0-mysql
    php7.0-opcache
    php7.0-soap
    # provides xml, xsl, DOM, SimpleXML
    php7.0-xml
    php7.0-zip
    php-redis
)

default['php']['ini'] = {
    'disable_functions'         => '',
    'disable_classes'           => '',
    'display_errors'            => 'Off',
    'display_startup_errors'    => 'Off',
    'log_errors'                => 'On',
    'error_log'                 => '',
    'log_errors_max_len'        => '1024',
    'report_zend_debug'         => '0',
    'html_errors'               => 'Off',
    'error_reporting'           => 'E_ALL & ~E_DEPRECATED & ~E_STRICT',
    'realpath_cache_size'       => '1m',
    'realpath_cache_ttl'        => '240',
    'max_execution_time'        => '120',
    'max_input_time'            => '60',
    'max_input_nesting_level'   => '64',
    'max_input_limit'           => '1000',
    'memory_limit'              => '256M',
    'post_max_size'             => '16M',
    'auto_prepend_file'         => '',
    'auto_append_file'          => '',
    'default_mimetype'          => 'text/html',
    'default_charset'           => 'UTF-8',
    'include_path'              => '.:./vendor:',
    'enable_dl'                 => 'Off',
    'file_uploads'              => 'On',
    'upload_tmp_dir'            => '',
    'upload_max_filesize'       => '10M',
    'max_file_uploads'          => '10',
    'allow_url_fopen'           => 'Off',
    'allow_url_include'         => 'Off',
    'default_socket_timeout'    => '60',
    'date.timezone'             => 'UTC',
    'pdo_mysql.cache_size'      => '',
    'pdo_mysql.default_socket'  => '',
    'SMTP'                      => 'localhost',
    'smtp_port'                 => '25',
    'sendmail_path'             => '',
    'sendmail_from'             => '',
    'mail_add_x_header'         => '',
    'mail_log'                  => '',
    'curl.cainfo'               => '',
    'openssl.cafile'            => '',
    'openssl.capath'            => ''
}