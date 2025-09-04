# remote_install Cookbook CHANGELOG

This file is used to list changes made in each version of the remote_install cookbook.

## 3.0.4 - *2025-09-04*

## 3.0.3 - *2024-05-02*

## 3.0.2 - *2024-05-02*

## 3.0.1 - *2023-10-03*

- Fix markdown formatting in the README

## 3.0.0 - *2022-02-23*

- resolved cookstyle error: resources/remote_install.rb:1:1 refactor: `Chef/Deprecations/ResourceWithoutUnifiedTrue`
- Require unified_mode for Chef 18 support
- Require Chef 15.3. for unified_mode support
- Use shared GitHub Actions workflow

## 2.1.5 - *2022-02-08*

- Remove delivery folder

## 2.1.4 - *2021-08-31*

- Standardise files with files in sous-chefs/repo-management

## 2.1.3 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 2.1.2 - *2021-03-25*

- Fix Changelog formatting issue

## 2.1.1 - *2021-03-25*

- resolved cookstyle error: resources/remote_install.rb:53:28 convention: `Style/RedundantBegin`
- resolved cookstyle error: resources/remote_install.rb:54:9 convention: `Layout/IndentationWidth`
- resolved cookstyle error: resources/remote_install.rb:55:7 convention: `Layout/ElseAlignment`
- resolved cookstyle error: resources/remote_install.rb:56:9 convention: `Layout/IndentationWidth`
- resolved cookstyle error: resources/remote_install.rb:57:7 warning: `Layout/EndAlignment`
- resolved cookstyle error: resources/remote_install.rb:58:1 convention: `Layout/EmptyLinesAroundMethodBody`
- resolved cookstyle error: resources/remote_install.rb:58:1 convention: `Layout/TrailingWhitespace`

## 2.1.0 - *2021-03-15*

- Sous Chefs Adoption
- Fix inspec tests
- Various CookStyle fixes
- Initial public release

## 2.0.0 (2017-08-25)

- Enable full linting and unit/integration testing in Travis
- Minimal RHEL installs don’t ship with `tar` so make sure we install it
- Silence deprecation warnings about ChefSpec.define_matcher
- Use SPDX standard license string in the metadata
- Remove the Rakefile and replace it with Delivery Local Mode
- Add requirements section to the readme
- Fix how specs set the platform and remove report at end
- Convert to a custom resource and require Chef 12.7+

## v1.0.2

- the -v flag for tar is unsupported on older and bsd versions of tar, which is an issue on older platforms

## v1.0.1

- Compute extract path basename based on tarball name.  Add md5 support.
- Allow the basename of extracted directory to be specified.

## v1.0.0
