describe command('/usr/local/bin/bash --version') do
  its(:stdout) { should match('4.3') }
end
