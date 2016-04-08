require 'spec_helper'
describe 'sumologic' do

  context 'with default values for all parameters' do
    it { should contain_class('sumologic') }
  end
end
