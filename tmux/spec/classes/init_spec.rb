require 'spec_helper'
describe 'tmux' do
  context 'with default values for all parameters' do
    it { should contain_class('tmux') }
  end
end
