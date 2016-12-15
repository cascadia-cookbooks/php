default['php']['sapi']['fpm']['ini'] = {
    :disable_functions         => '"dl, exec, gc_collect_cycles, gc_disable, gc_enable, gc_enabled,
        get_cfg_var, get_current_user, getcwd, getlastmod, getmygid, getmyinode, getmypid, getmyuid, lchgrp, lchown, link,
        passthru, pclose, pcntl_alarm, pcntl_exec, pcntl_fork, pcntl_get_last_error, pcntl_getpriority, pcntl_setpriority,
        pcntl_signal, pcntl_signal_dispatch, pcntl_sigprocmask, pcntl_sigtimedwait, pcntl_sigwaitinfo, pcntl_strerror,
        pcntl_wait, pcntl_waitpid, pcntl_wexitstatus, pcntl_wifexited, pcntl_wifsignaled, pcntl_wifstopped, pcntl_wstopsig,
        pcntl_wtermsig, php_uname, phpinfo, popen, posix_getlogin, posix_mkfifo, posix_ttyname, proc_close, proc_get_status,
        proc_nice, proc_open, proc_terminate, prog_get_status, putenv, rename, set_time_limit, shell_exec, show_source, system"',
    :disable_classes           => '',
    :display_errors            => 'Off',
    :display_startup_errors    => 'Off',
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

default['php']['sapi']['fpm']['conf'] = {
    :syslog_facility                => 'daemon',
    :syslog_ident                   => 'php-fpm',
    :log_level                      => 'notice',
    :emergency_restart_threshold    => '0',
    :emergency_restart_interval     => '0',
    :process_control_timeout        => '0',
    :process_max                    => '128',
    :daemonize                      => 'yes',
    :rlimit_files                   => '1024',
    :rlimit_core                    => '0',
    :events_mechanism               => 'epoll',
    :systemd_interval               => '10',
    :pools => {
        :www => {
            :pool_name                      => 'www',
            :prefix                         => '',
            :listen_backlog                 => '511',
            :listen_mode                    => '0660',
            :listen_acl_users               => '',
            :listen_acl_groups              => '',
            :listen_allowed_clients         => '127.0.0.1',
            :process_priority               => '-19',
            :pm                             => 'dynamic',
            :pm_max_children                => '5',
            :pm_start_servers               => '2',
            :pm_min_spare_servers           => '1',
            :pm_max_spare_servers           => '3',
            :pm_process_idle_timeout        => '10s',
            :pm_max_requests                => '500',
            :pm_status_path                 => '/status',
            :ping_path                      => '/ping',
            :ping_response                  => 'pong',
            :access_log                     => '""',
            :access_format                  => '"%R - %u %t \"%m %r%Q%q\" %s %f %{mili}d %{kilo}M %C%%"',
            :slowlog                        => '""',
            :request_slowlog_timeout        => '0',
            :request_terminate_timeout      => '0',
            :rlimit_files                   => '1024',
            :rlimit_core                    => '0',
            :chroot                         => '',
            :chdir                          => '',
            :catch_workers_output           => 'yes',
            :clear_env                      => 'no',
            :security_limit_extensions      => '.php .php3 .php4 .php5 .php7',
            :env_hostname                   => '$HOSTNAME',
            :env_tmp                        => '"/tmp"',
            :env_tmpdir                     => '"/tmp"',
            :env_temp                       => '"/tmp"',
            :php_admin_flags                => {},
            :php_admin_values               => {},
            :php_flags                      => {},
            :php_values                     => {},
        }
    }
}

case node['platform_family']
when 'debian'
    # Note similar package names do not necessarily denote the same provided
    # extensions for some meta packages like php7.0-common.
    default['php']['sapi']['fpm']['ini_path']            = '/etc/php/7.0/fpm'
    default['php']['sapi']['fpm']['fpm_service_name']    = 'php7.0-fpm'
    default['php']['sapi']['fpm']['fpm_pool_conf_path']  = '/etc/php/7.0/fpm/pool.d'
    default['php']['sapi']['fpm']['module_ini_path']     = '/etc/php/7.0/fpm/conf.d'
    default['php']['sapi']['fpm']['module_ini_filename'] = 'php.ini'
    default['php']['sapi']['fpm']['package']             = 'php7.0-fpm'
    default['php']['sapi']['fpm']['conf']['pid']         = '"/run/php/php7.0-fpm.pid"'
    default['php']['sapi']['fpm']['conf']['error_log']   = '"/var/log/php7.0-fpm.log"'
    default['php']['sapi']['fpm']['conf']['include']     = '"/etc/php/7.0/fpm/pool.d/*.conf"'

    default['php']['sapi']['fpm']['conf']['pools']['www']['listen']       = '"/run/php/php7.0-fpm.sock"'
    default['php']['sapi']['fpm']['conf']['pools']['www']['env_path']     = '"/usr/local/bin:/usr/bin:/bin"'
    default['php']['sapi']['fpm']['conf']['pools']['www']['user']         = 'www-data'
    default['php']['sapi']['fpm']['conf']['pools']['www']['group']        = 'www-data'
    default['php']['sapi']['fpm']['conf']['pools']['www']['listen_user']  = 'www-data'
    default['php']['sapi']['fpm']['conf']['pools']['www']['listen_group'] = 'www-data'
when 'rhel'
    # Note similar package names do not necessarily denote the same provided
    # extensions for some meta packages like php70u-common.
    default['php']['sapi']['fpm']['ini_path']            = '/etc'
    default['php']['sapi']['fpm']['fpm_service_name']    = 'php-fpm'
    default['php']['sapi']['fpm']['fpm_pool_conf_path']  = '/etc/php-fpm.d'
    default['php']['sapi']['fpm']['module_ini_path']     = '/etc/php.d'
    default['php']['sapi']['fpm']['module_ini_filename'] = 'php.ini'
    default['php']['sapi']['fpm']['package']             = 'php70u-fpm'
    default['php']['sapi']['fpm']['conf']['pid']         = '"/run/php-fpm/php-fpm.pid"'
    default['php']['sapi']['fpm']['conf']['error_log']   = '"/var/log/php-fpm/php-fpm-error.log"'
    default['php']['sapi']['fpm']['conf']['include']     = '"/etc/php-fpm.d/*.conf"'

    default['php']['sapi']['fpm']['conf']['pools']['www']['listen']       = '"/run/php-fpm/php-fpm.sock"'
    default['php']['sapi']['fpm']['conf']['pools']['www']['env_path']     = '"/sbin:/bin:/usr/sbin:/usr/bin"'
    default['php']['sapi']['fpm']['conf']['pools']['www']['user']         = 'nobody'
    default['php']['sapi']['fpm']['conf']['pools']['www']['group']        = 'nobody'
    default['php']['sapi']['fpm']['conf']['pools']['www']['listen_user']  = 'nobody'
    default['php']['sapi']['fpm']['conf']['pools']['www']['listen_group'] = 'nobody'
end
