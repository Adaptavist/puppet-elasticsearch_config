require 'spec_helper'
 
describe 'elasticsearch_config', :type => 'class' do
    
  context "Should install elasticsearch" do
    let(:facts) { { :host => Hash.new, :kernel => 'Linux', :osfamily => 'Debian', :operatingsystem => 'Debian' } }
    it do
      should contain_class('elasticsearch')
      should contain_class('oracle_java')
    end
  end
end
