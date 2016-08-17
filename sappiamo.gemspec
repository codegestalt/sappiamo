# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sappiamo/version'

Gem::Specification.new do |spec|
  spec.name          = "sappiamo"
  spec.version       = Sappiamo::VERSION
  spec.authors       = ["Rodrigo Haenggi"]
  spec.email         = ["rodrigo@codegestalt.com"]

  spec.summary       = %q{Ruby wrapper for the sappiamo-api server}
  spec.description   = %q{Ruby wrapper for the sappiamo-api server}
  spec.homepage      = "https://github.com/codegestalt/sappiamo"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
