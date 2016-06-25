# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'figment/version'

Gem::Specification.new do |spec|
  spec.name          = 'figment'
  spec.version       = Figment::VERSION
  spec.authors       = ['Mark Borcherding']
  spec.email         = ['markborcherding@gmail.com']

  spec.summary       = 'Change normal text into amazingly colorful text.'
  spec.description   = 'Change normal text into amazingly colorful text. Accept a stream or a string.'
  spec.homepage      = 'https://github.com/markborcherding/figment'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rainbow', '~> 2.1', '>= 2.1.0'
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'nyan-cat-formatter', '~> 0.11'
end
