require 'serverspec'

set :backend, :exec

describe 'bash' do
  describe command('/usr/local/bin/bash --version') do
    its(:stdout) { should match('4.3') }
  end
end
