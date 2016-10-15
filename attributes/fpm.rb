default['php']['ini']['fpm'] = {
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
            :prefix                         => '"/path/to/pools/$pool"',
            :user                           => 'www-data',
            :group                          => 'www-data',
             :listen_backlog                 => '511',
            :listen_owner                   => 'www-data',
            :listen_group                   => 'www-data',
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
            :access_log                     => 'log/$pool.access.log',
            :access_format                  => '"%R - %u %t \"%m %r%Q%q\" %s %f %{mili}d %{kilo}M %C%%"',
            :slowlog                        => 'log/$pool.log.slow',
            :request_slowlog_timeout        => '0',
            :request_terminate_timeout      => '0',
            :rlimit_files                   => '1024',
            :rlimit_core                    => '0',
            :chroot                         => '',
            :chdir                          => '"/var/www"',
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

case node['platform']
    when 'ubuntu'
        default['php']['fpm_service_name'] = 'php7.0-fpm'
        default['php']['fpm_pool_conf_path'] = '/etc/php/7.0/fpm/pool.d'

        # extensions to activate
        # php7.0-common provides iconv http://packages.ubuntu.com/xenial/php7.0-iconv
        # php7.0-xml provides xml, xsl, DOM, SimpleXML

        # Note similar package names do not necessarily denote the same provided extensions for some meta packages like php7.0-common.
        default['php']['fpm-package'] = 'php7.0-fpm'

        default['php']['ini']['fpm'] = {
            :pid                            => '"/run/php/php7.0-fpm.pid"',
            :error_log                      => '"/var/log/php7.0-fpm.log"',
            :include                        => '"/etc/php/7.0/fpm/pool.d/*.conf"',
            :pools => {
                :www => {
                    :listen                 => '"/run/php/php7.0-fpm.sock"',
                    :env_path               => '"/usr/local/bin:/usr/bin:/bin"',
                }
            }
        }

    when 'centos'
        default['php']['fpm_service_name'] = 'php-fpm'
        default['php']['fpm_pool_conf_path'] = '/etc/php-fpm.d'

        # Note similar package names do not necessarily denote the same provided extensions for some meta packages like php70u-common.
        default['php']['fpm-package'] = 'php70u-fpm'

        default['php']['ini']['fpm'] = {
            :pid                            => '"/run/php-fpm/php-fpm.pid"',
            :error_log                      => '"/var/log/php-fpm/php-fpm-error.log"',
            :include                        => '"/etc/php/7.0/fpm/pool.d/*.conf"',
            :pools => {
                :www => {
                    :listen                 => '"/run/php-fpm/php-fpm.sock"',
                    :env_path               => '"/sbin:/bin:/usr/sbin:/usr/bin"',
                }
            }
        }
end