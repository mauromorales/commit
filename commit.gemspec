# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'commit/version'

Gem::Specification.new do |spec|
  spec.name          = "commit"
  spec.version       = Commit::VERSION
  spec.authors       = ["Mauro Morales"]
  spec.email         = ["contact@mauromorales.com"]
  spec.description   = %q{form habits through your CLI}
  spec.summary       = %q{form habits through your CLI}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ['commit'] #spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "aruba"
end
