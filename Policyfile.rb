# frozen_string_literal: true

name 'remote_install'

run_list 'test::install'

named_run_list :default, 'test::install'
named_run_list :install, 'test::install'

cookbook 'remote_install', path: '.'
cookbook 'test', path: 'test/fixtures/cookbooks/test'
