# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'infogram-ruby'
  s.version       = '0.0.1'
  s.authors       = ['Maksim Berjoza']
  s.email         = ['torbjon@gmail.com']
  s.summary       = %q{Infogr.am Ruby SDK}
  s.description   = %q{Ruby library for Infogr.am}
  s.homepage      = ''
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_dependency 'httparty', '~> 0.13'
  s.add_dependency 'json', '~> 1.8'
end
