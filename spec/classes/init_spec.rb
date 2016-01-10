require 'spec_helper'
describe 'servicenowreporter' do

  context 'with defaults for all parameters' do
    it { should contain_class('servicernoweporter') }
  end
end
