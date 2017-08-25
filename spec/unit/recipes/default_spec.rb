require 'spec_helper'

describe 'default recipe on Ubuntu 16.04' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') }
  let(:chef_run) { runner.converge('remote_install::default') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
