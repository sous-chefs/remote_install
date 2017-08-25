#
# Cookbook:: remote_install
# Resource:: remote_install
#
# Copyright 2014-2017, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

provides :remote_install

property :source,            String, required: true
property :version,           String, required: true
property :checksum,          String, required: true
property :checksum_type,     String, default: 'sha256'
property :build_command,     String
property :compile_command,   String
property :install_command,   String, required: true
property :environment,       Hash,   default: {}
property :extract_basename,  String, default: lazy { |r| "#{r.name}-#{r.version}" }

action(:install) do
  converge_by("Install #{new_resource}") do
    download
    verify
    extract
    build
    compile
    install
  end
end

action_class do
  def id
    @id ||= "#{new_resource.name}-#{new_resource.version}"
  end

  def label(name)
    @label ||= "#{name}[#{id}]"
  end

  def tarball_extension
    @tarball_extension ||= begin
      if (tarball_extension = new_resource.source.match(/\.tar\.bz2|\.tgz|\.tar\.gz|\.tar$/))
        tarball_extension.to_s
      else
        '.tar.gz'
      end
    end
  end

  def cache_path
    @cache_path ||= ::File.join(Config[:file_cache_path], "#{id}#{tarball_extension}")
  end

  def extract_path
    @extract_path ||= ::File.join(Config[:file_cache_path], new_resource.extract_basename)
  end

  def download
    remote_file = Resource::RemoteFile.new(label('download'), run_context)
    remote_file.path(cache_path)
    remote_file.source(new_resource.source)
    remote_file.backup(false)
    remote_file.run_action(:create)
  end

  def verify
    require 'digest/sha2' unless defined?(Digest::SHA256)

    if new_resource.checksum_type == 'md5'
      checksum = Digest::MD5.file(cache_path).hexdigest
    elsif new_resource.checksum_type == 'sha256'
      checksum = Digest::SHA256.file(cache_path).hexdigest
    end

    unless new_resource.checksum == checksum # rubocop: disable Style/GuardClause
      raise <<-EOH
Verification for #{resource} failed due to a checksum mismatch:

  expected: #{resource.checksum}
  actual:   #{actual}

This added security check is used to prevent MITM attacks when downloading the
remote file. If you have updated the version or URL for the download, you will
also need to update the checksum value. You can find the checksum value on the
software publishers website.
EOH
    end
  end

  def extract
    extract_command = 'tar -x'
    extract_command << 'z' if new_resource.source =~ /\.gz/
    extract_command << 'j' if new_resource.source =~ /\.bz2/

    execute = Resource::Execute.new(label('extract'), run_context)
    execute.command("#{extract_command} -f #{cache_path}")
    execute.cwd(Config[:file_cache_path])
    execute.run_action(:run)
  end

  %w(build compile install).each do |stage|
    class_eval <<-EOH, __FILE__, __LINE__ + 1
      def #{stage}
        return if new_resource.#{stage}_command.nil?

        execute = Resource::Execute.new(label('#{stage}'), run_context)
        execute.command(new_resource.#{stage}_command)
        execute.cwd(extract_path)
        execute.environment(new_resource.environment)
        execute.run_action(:run)
      end
    EOH
  end
end
