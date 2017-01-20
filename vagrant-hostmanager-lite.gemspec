# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-hostmanager-lite/version'

Gem::Specification.new do |gem|
  gem.name          = 'vagrant-hostmanager-lite'
  gem.version       = VagrantPlugins::HostManager::VERSION
  gem.authors       = ['Shawn Dahlen']
  gem.email         = ['shawn@dahlen.me']
  gem.description   = %q{A Vagrant plugin that manages the /etc/hosts file within a multi-machine environment}
  gem.summary       = gem.description

  gem.add_runtime_dependency "parallel", '1.10.0'

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
