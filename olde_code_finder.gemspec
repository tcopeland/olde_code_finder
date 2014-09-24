# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'olde_code_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "olde_code_finder"
  spec.version       = OldeCodeFinder::VERSION
  spec.authors       = ["Tom Copeland"]
  spec.email         = ["tom.copeland@livingsocial.com"]
  spec.summary       = %q{OldeCodeFinder finds your olde code.}
  spec.description   = %q{OldeCodeFinder finds your olde code.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_runtime_dependency "rake"
end
