require 'spec_helper'
describe 'sabnzbd' do

  context 'with defaults for all parameters' do
    it { should contain_class('sabnzbd') }
  end
end
