require 'spec_helper'

describe 'cop_php::default' do

    describe command('php -v') do
        its(:stdout) { should match /7.0/ }
    end

end
