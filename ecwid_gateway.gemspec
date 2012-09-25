# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ecwid_gateway/version'

Gem::Specification.new do |gem|
  gem.name          = "ecwid_gateway"
  gem.version       = EcwidGateway::VERSION
  gem.authors       = ["Andrey Kumanyaev"]
  gem.email         = ["me@zzet.org"]
  gem.description   = %q{Ecwid API wrapper}
  gem.summary       = %q{Some summary}
  gem.homepage      = ""

  gem.add_dependency 'weary'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
