lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'infogram/version'

Gem::Specification.new do |s|
  s.name          = 'infogram'
  s.version       = Infogram::VERSION
  s.authors       = ['Maksim Berjoza']
  s.email         = ['torbjon@gmail.com']
  s.summary       = 'Infogr.am Ruby SDK'
  s.description   = 'Ruby library for Infogr.am'
  s.homepage      = 'https://github.com/infogram/infogram-ruby'
  s.license       = 'MIT'

  s.files         = `git ls-files -x Gemfile.lock`.split("\n") rescue ''
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_dependency 'httparty', '~> 0.13'
  s.add_dependency 'json', '~> 2.6', '>= 2.6.3'
end
