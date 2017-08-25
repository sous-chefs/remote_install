# remote_install Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/remote_install.svg?branch=master)](https://travis-ci.org/chef-cookbooks/remote_install) [![Cookbook Version](https://img.shields.io/cookbook/v/remote_install.svg)](https://supermarket.chef.io/cookbooks/remote_install)

Provides a highly-opinionated way to download, extract, and compile software from a remote source.

## Requirements

### Platforms

- Debian/Ubuntu
- RHEL/CentOS/Scientific/Amazon/Oracle

### Chef

- Chef 12.7+

### Cookbooks

- none

## Usage

Install bash:

```ruby
remote_install 'bash' do
  source 'http://ftp.gnu.org/gnu/bash/bash-4.3.tar.gz'
  version '4.3'
  checksum 'afc687a28e0e24dc21b988fa159ff9dbcf6b7caa92ade8645cc6d5605cd024d4'
  build_command './configure'
  compile_command 'make'
  install_command 'make install'
end
```

The `remote_install` resource has the following attributes:

Attribute         | Description
----------------- | ----------------------------------------------------------
`source`          | the URL to download
`checksum`        | the SHA256 checksum for the downlaoded asset from `source`
`build_command`   | the command to "build"
`compile_command` | the command to "compile"
`install_command` | the command to "install"
`environment`     | the environment to set while building

## Maintainers

This cookbook is maintained by Chef's Community Cookbook Engineering team. Our goal is to improve cookbook quality and to aid the community in contributing to cookbooks. To learn more about our team, process, and design goals see our [team documentation](https://github.com/chef-cookbooks/community_cookbook_documentation/blob/master/COOKBOOK_TEAM.MD). To learn more about contributing to cookbooks like this see our [contributing documentation](https://github.com/chef-cookbooks/community_cookbook_documentation/blob/master/CONTRIBUTING.MD), or if you have general questions about this cookbook come chat with us in #cookbok-engineering on the [Chef Community Slack](http://community-slack.chef.io/)

## License

```text
Copyright 2014-2017, Chef Software, Inc. (<legal@chef.io>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
