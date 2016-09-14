require 'spec_helper'

describe 'cop_php::default' do

    it 'php7.0-fpm is enabled' do
        expect(service('php7.0-fpm')).to be_enabled
    end

    it 'php7.0-fpm service is running' do
        expect(service('php7.0-fpm')).to be_running
    end

    # make this platform / platform_version specific
    case os[:release]
        when '14.04'
            describe command('php -v') do
                its(:stdout) { should match /7.0/ }
            end

        when '16.04'
            describe command('php -v') do
                its(:stdout) { should match /7.0/ }
            end
    end

    describe file('/etc/php/7.0/fpm/php.ini') do
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
        it { should be_mode '644' }
    end

    describe file('/etc/php/7.0/fpm/conf.d/11-opcache.ini') do
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
        it { should be_mode '644' }
    end

    describe file('/etc/php/7.0/fpm/conf.d/11-opcache.ini') do
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
        it { should be_mode '644' }
    end
end