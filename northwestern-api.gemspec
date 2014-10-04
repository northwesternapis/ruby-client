# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'northwestern/version'

Gem::Specification.new do |spec|
  spec.name          = "northwestern-api"
  spec.version       = Northwestern::VERSION
  spec.authors       = ["Alex Kowalczuk"]
  spec.email         = ["alexskowalczuk@gmail.com"]
  spec.summary       = %q{A Ruby wrapper for the ASG Northwestern Course data API}
  spec.homepage      = %q{https://github.com/northwesternapis/ruby-client}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
