# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ghq/yaimport/version'

Gem::Specification.new do |spec|
  spec.name          = "ghq-yaimport"
  spec.version       = Ghq::Yaimport::VERSION
  spec.authors       = ["ganmacs"]
  spec.email         = ["ganmacs@gmail.com"]

  spec.summary       = "Yet anther ghq import"
  spec.description   = "Yet anther ghq import"
  spec.homepage      = "https://github.com/ganmacs/ghq-yaimport"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "faraday"
end
