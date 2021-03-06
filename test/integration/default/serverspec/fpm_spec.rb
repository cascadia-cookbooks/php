require 'spec_helper'

describe 'cop_php::fpm' do

    if :fpm_enabled

    # make this platform / platform_version specific
    case os[:family]
        when 'ubuntu'
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

            describe file('/etc/php/7.0/fpm/conf.d/12-session.ini') do
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode '644' }
            end

            describe file('/etc/php/7.0/fpm/conf.d/20-xdebug.ini') do
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode '644' }
            end

            describe file('/etc/php/7.0/fpm/conf.d/20-redis.ini') do
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
            end

            it 'php7.0-fpm is enabled' do
                expect(service('php7.0-fpm')).to be_enabled
            end

            it 'php7.0-fpm service is running' do
                expect(service('php7.0-fpm')).to be_running
            end

        when 'redhat'
            describe file('/etc/php.ini') do
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode '644' }
            end

            describe file('/etc/php.d/11-opcache.ini') do
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode '644' }
            end

            describe file('/etc/php.d/12-session.ini') do
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode '644' }
            end

            describe file('/etc/php.d/15-xdebug.ini') do
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode '644' }
            end

            describe file('/etc/php.d/redis.ini') do
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode '644' }
            end

            it 'php-fpm is enabled' do
                expect(service('php-fpm')).to be_enabled
            end

            it 'php-fpm service is running' do
                expect(service('php-fpm')).to be_running
            end
        end
    end
end
