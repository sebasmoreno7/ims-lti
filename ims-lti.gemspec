# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative "lib/ims/lti/version"

Gem::Specification.new do |spec|
  spec.name = 'ims-lti'
  spec.version = IMS::LTI::VERSION
  spec.authors = ['Instructure']
  spec.email = 'opensource@instructure.com'
  spec.summary = %q{Ruby library for creating IMS LTI tool providers and consumers}
  spec.homepage = %q{http://github.com/instructure/ims-lti}
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.3'

  spec.files = Dir['{lib}/**/*'] + ['LICENSE.txt', 'README.md', 'Changelog.txt']
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'addressable', '~> 2.9'
  spec.add_dependency 'builder', '~> 3.3'
  # The OAuth middleware still targets Faraday 1. Move both together when
  # registration signatures have been verified against Faraday 2.
  spec.add_dependency 'faraday', '~> 1.10.6'
  spec.add_dependency 'faraday_middleware', '~> 1.2.1'
  spec.add_dependency 'json-jwt', '~> 1.15.3.1'
  spec.add_dependency 'simple_oauth', '~> 0.3.1'
  spec.add_dependency 'rexml', '~> 3.4', '>= 3.4.4'

  spec.add_development_dependency 'rake', '~> 13.4'
  spec.add_development_dependency 'rspec', '~> 3.13'
  spec.add_development_dependency 'timecop', '~> 0.9.11'
end
