name              'remote_install'
maintainer        'Chef Software, Inc.'
maintainer_email  'releng@chef.io'
license           'Apache 2.0'
description       'Provides an opinionated way to download and install remote software'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.0.2'

supports 'centos'
supports 'debian'
supports 'fedora'
supports 'oracle'
supports 'redhat'
supports 'freebsd'
supports 'scientific'
supports 'mac_os_x'
supports 'ubuntu'
supports 'windows'

source_url 'https://github.com/chef-cookbooks/remote_install' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/remote_install/issues' if respond_to?(:issues_url)
