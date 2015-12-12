if defined?(ChefSpec)
  ChefSpec.define_matcher :remote_install

  def install_remote_install(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:remote_install, :install, resource_name)
  end
end
