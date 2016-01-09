require 'spec_helper'
describe 'servicereport' do

  context 'with defaults for all parameters' do
    it { should contain_class('servicereport') }
  end
end
