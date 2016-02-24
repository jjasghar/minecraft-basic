require 'spec_helper'

describe 'minecraft-basic::rendermap' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  describe port(80) do
    it { should be_listening }
  end

  describe command('curl http://localhost') do
    its(:stdout) { should match /Chef Minecraft/ }
  end
end
