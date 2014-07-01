require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'bash' do
  describe command('/usr/local/bin/bash --version') do
    it { should return_stdout(/4\.3/) }
  end
end
