# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'ecwid_gateway/version'

Gem::Specification.new do |gem|
  gem.name          = "ecwid_gateway"
  gem.version       = EcwidGateway::VERSION
  gem.authors       = ["Andrey Kumanyaev"]
  gem.email         = ["me@zzet.org"]
  gem.description   = %q{Ecwid API wrapper}
  gem.summary       = %q{Ecwid API wrapper}
  gem.homepage      = ""

  gem.rubyforge_project = "ecwid_gateway"

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'weary'
  gem.add_runtime_dependency 'json'
end
