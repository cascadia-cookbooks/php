# set OS specific settings
case node['platform']
when 'ubuntu'
    include_recipe 'apt'
when 'centos'
    # install epel as a prerequisite for IUS
    package 'epel-release' do
        action :install
    end
    # Adapted from https://setup.ius.io/
    bash 'install IUS package repository support' do
        code <<-EOH
            yum -y install https://centos7.iuscommunity.org/ius-release.rpm
            rpm --import /etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY
        EOH
    end
end

include_recipe 'cop_php::install'
