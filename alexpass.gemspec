lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'alexpass.rb'

Gem::Specification.new do |s|
  s.name        = 'alexpass'
  s.version     = Alexpass::VERSION

  s.summary     = Alexpass::DEPRECATED
  s.description = "#{s.summary} (https://rubygems.org/gems/altpass)"

  s.authors     = ['Alex Batko']
  s.email       = ['alexbatko@gmail.com']

  s.homepage    = 'https://github.com/abatko/alexpass'

  s.files       = ['lib/alexpass.rb']
  s.test_files  = Dir["test/**/*"]

  s.license     = 'MIT'

  s.post_install_message = <<-MESSAGE
!    #{Alexpass::DEPRECATED}
  MESSAGE
end

