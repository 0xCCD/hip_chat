# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hip_chat/version'

Gem::Specification.new do |spec|
  spec.name          = "hip_chat"
  spec.version       = HipChat::VERSION
  spec.authors       = ["Syed Humza Shah"]
  spec.email         = ["humzashah+github@gmail.com"]

  spec.summary       = "Use Ruby to control HipChat."
  spec.description   = "Easily communicate with HipChat using via their API's v2."
  spec.homepage      = "https://github.com/humzashah/hip_chat"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency "bundler", ">= 1.8"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"

  spec.add_dependency "httparty"
end
