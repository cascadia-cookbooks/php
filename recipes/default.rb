# set OS specific settings
case node['platform']
when 'ubuntu'
    include_recipe 'apt'
end

include_recipe 'cop_php::install'