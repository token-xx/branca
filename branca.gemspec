# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'branca/version'

Gem::Specification.new do |spec|
  spec.name          = 'branca'
  spec.version       = Branca::VERSION
  spec.authors       = ['Peter Johanson']
  spec.email         = ['peter.johanson@crossoverhealth.com']

  spec.summary       = 'Simple implementation of the Branca secure tokens'
  spec.description   = 'Simple implementation of the Branca secure tokens'
  spec.homepage      = 'https://github.com/crossoverhealth/branca'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'base_x', '~> 0.8.1'
  spec.add_dependency 'rbnacl', '~> 7.1'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.70'
end
