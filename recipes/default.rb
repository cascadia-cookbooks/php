# set OS specific settings

case node['platform_family']
when 'debian'
when 'rhel'
    # Adapted from https://setup.ius.io/
    bash 'install IUS package repository support' do
        code <<-EOH
            yum -y install https://centos7.iuscommunity.org/ius-release.rpm
            rpm --import /etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY
        EOH
        not_if 'yum repolist all | grep -i ius'
    end
end

# base PHP install with default packages
include_recipe 'cop_php::install'

# install each sapi package independently
node['php']['sapi'].each_pair do |sapiname, value|
    if value['enable']
        include_recipe "cop_php::#{sapiname}"
    end
end

# build redis package from source
include_recipe "cop_php::redis"
include_recipe "cop_php::xdebug"
