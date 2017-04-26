default['php']['xdebug']['enabled'] = false
default['php']['xdebug']['config_file'] = "#{node['php']['ext']['conf_path']}/xdebug.ini"
default['php']['xdebug']['directives'] = {
    :auto_trace              => '0',
    :cli_color               => '1',
    :default_enable          => '0',
    :max_nesting_level       => '256',
    :profiler_enable         => '0',
    :profiler_enable_trigger => '1',
    :profiler_output_name    => 'cachegrind.out.%p.%H%R.%t',
    :remote_autostart        => '0',
    :remote_connect_back     => '1',
    :remote_enable           => '1',
    :scream                  => '0',
    :show_mem_delta          => '1',
    :trace_enable_trigger    => '1',
    :trace_format            => '0',
    :trace_options           => '0',
    :trace_output_name       => 'trace.%H%R.%t'
}

# set os specific attributes
case node['platform_family']
when 'debian'
    default['php']['xdebug']['package'] = 'php-xdebug'
when 'rhel'
    default['php']['xdebug']['package'] = 'php70u-xdebug'
end
