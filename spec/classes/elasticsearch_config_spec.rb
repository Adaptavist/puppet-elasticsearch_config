require 'spec_helper'
 
describe 'elasticsearch_config', :type => 'class' do
    
  context "Should install elasticsearch" do
    let(:facts) {{
        :host => Hash.new,
        :kernel => 'Linux',
        :osfamily => 'Debian',
        :lsbdistid => 'debian',
        :lsbdistcodename => 'debian',
        :lsbdistrelease => '14.04',
        :operatingsystem => 'Debian',
        :operatingsystemmajrelease => '14',
        :puppetversion => Puppet.version
    }}
    
    it do
      should contain_class('elasticsearch')
      should contain_class('oracle_java')
    end
  end
end
