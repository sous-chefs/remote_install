name              'remote_install'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache-2.0'
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

source_url 'https://github.com/chef-cookbooks/remote_install'
issues_url 'https://github.com/chef-cookbooks/remote_install/issues'
chef_version '>= 12.7' if respond_to?(:chef_version)
