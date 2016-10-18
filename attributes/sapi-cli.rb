default['php']['sapi']['cli']['ini'] = {
    :disable_functions         => '""',
    :disable_classes           => '',
    :display_errors            => 'Off',
    :display_startup_errors    => 'On',
    :log_errors                => 'On',
    :error_log                 => '',
    :log_errors_max_len        => '1024',
    :report_zend_debug         => '0',
    :html_errors               => 'Off',
    :error_reporting           => 'E_ALL & ~E_DEPRECATED & ~E_STRICT',
    :realpath_cache_size       => '2M',
    :realpath_cache_ttl        => '240',
    :max_execution_time        => '120',
    :max_input_time            => '60',
    :max_input_nesting_level   => '64',
    :max_input_vars            => '1000',
    :memory_limit              => '256M',
    :post_max_size             => '16M',
    :auto_prepend_file         => '',
    :auto_append_file          => '',
    :default_mimetype          => 'text/html',
    :default_charset           => 'UTF-8',
    :include_path              => '.:./vendor:',
    :enable_dl                 => 'Off',
    :file_uploads              => 'On',
    :upload_tmp_dir            => '',
    :upload_max_filesize       => '10M',
    :max_file_uploads          => '10',
    :allow_url_fopen           => 'Off',
    :allow_url_include         => 'Off',
    :default_socket_timeout    => '60',
    :date_timezone             => 'UTC',
    :pdo_mysql_cache_size      => '',
    :pdo_mysql_default_socket  => '',
    :SMTP                      => 'localhost',
    :smtp_port                 => '25',
    :sendmail_path             => '',
    :sendmail_from             => '',
    :mail_add_x_header         => '',
    :mail_log                  => '',
    :curl_cainfo               => '',
    :openssl_cafile            => '',
    :openssl_capath            => '',
    :custom_values             => {}
}

case node['platform']
    when 'ubuntu'
        default['php']['sapi']['cli']['package']            = 'php7.0-cli'
        default['php']['sapi']['cli']['ini_path']           = '/etc/php/7.0/cli'
        default['php']['sapi']['cli']['module_ini_path']    = '/etc/php/7.0/cli/conf.d'
    when 'centos'
        default['php']['sapi']['cli']['package']            = 'php70u-cli'
        default['php']['sapi']['cli']['ini_path']           = '/etc'
        default['php']['sapi']['cli']['module_ini_path']    = '/etc/php.d'
end
