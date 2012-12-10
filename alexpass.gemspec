lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'alexpass.rb'

Gem::Specification.new do |s|
  s.name        = 'alexpass'
  s.version     = Alexpass::VERSION

  s.summary     = 'Generate passwords derived from hand-alternating, visually unambiguous, alphanumeric characters'
  s.description = "#{s.summary}."

  s.authors     = ['Alex Batko']
  s.email       = ['alexbatko@gmail.com']

  s.homepage    = 'https://github.com/abatko/alexpass'

  s.files       = ['lib/alexpass.rb']
  s.test_files  = Dir["test/**/*"]

  s.license     = 'MIT'
end

