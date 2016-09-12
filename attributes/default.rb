# extensions to activate
# php7.0-common provides iconv http://packages.ubuntu.com/xenial/php7.0-iconv
# php7.0-xml provides xml, xsl, DOM, SimpleXML

default['php']['packages'] = %w(
    php7.0-bcmath
    php7.0-cli
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
    php7.0-xml
    php7.0-zip
    php-redis
)

default['php']['ini'] = {
    :disable_functions         => 'dl, exec, gc_collect_cycles, gc_disable, gc_enable, gc_enabled,
        get_cfg_var, get_current_user, getcwd, getlastmod, getmygid, getmyinode, getmypid, getmyuid, lchgrp, lchown, link,
        passthru, pclose, pcntl_alarm, pcntl_exec, pcntl_fork, pcntl_get_last_error, pcntl_getpriority, pcntl_setpriority,
        pcntl_signal, pcntl_signal_dispatch, pcntl_sigprocmask, pcntl_sigtimedwait, pcntl_sigwaitinfo, pcntl_strerror,
        pcntl_wait, pcntl_waitpid, pcntl_wexitstatus, pcntl_wifexited, pcntl_wifsignaled, pcntl_wifstopped, pcntl_wstopsig,
        pcntl_wtermsig, php_uname, phpinfo, popen, posix_getlogin, posix_mkfifo, posix_ttyname, proc_close, proc_get_status,
        proc_nice, proc_open, proc_terminate, prog_get_status, putenv, rename, set_time_limit, shell_exec, show_source, system',
    :disable_classes           => '',
    :display_errors            => 'Off',
    :display_startup_errors    => 'Off',
    :log_errors                => 'On',
    :error_log                 => '',
    :log_errors_max_len        => '1024',
    :report_zend_debug         => '0',
    :html_errors               => 'Off',
    :error_reporting           => 'E_ALL & ~E_DEPRECATED & ~E_STRICT',
    :realpath_cache_size       => '2m',
    :realpath_cache_ttl        => '240',
    :max_execution_time        => '120',
    :max_input_time            => '60',
    :max_input_nesting_level   => '64',
    :max_input_limit           => '1000',
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
