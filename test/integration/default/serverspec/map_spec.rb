require 'spec_helper'

describe 'minecraft-basic::map' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  describe port(80) do
    it { should be_listening }
  end
end
