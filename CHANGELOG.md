remote_install Cookbook CHANGELOG
=================================
This file is used to list changes made in each version of the remote_install cookbook.

## 2.0.0 (2017-08-25)

- Enable full linting and unit/integration testing in Travis
- Minimal RHEL installs don’t ship with `tar` so make sure we install it
- Silence deprecation warnings about ChefSpec.define_matcher
- Use SPDX standard license string in the metadata
- Remove the Rakefile and replace it with Delivery Local Mode
- Add requirements section to the readme
- Fix how specs set the platform and remove report at end
- Convert to a custom resource and require Chef 12.7+

v1.0.2
------
- the -v flag for tar is unsupported on older and bsd versions of tar, which is an issue on older platforms

v1.0.1
------
- Compute extract path basename based on tarball name.  Add md5 support.
- Allow the basename of extracted directory to be specified.

v1.0.0
------
- Initial public release
