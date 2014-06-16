Gem::Specification.new do |s|
  s.name    = 'phidget'
  s.version = '0.0.1'
  s.summary = 'Phidget LED toggler'
  s.author  = 'Duncan Bayne'

  s.files = Dir.glob('ext/**/*.{c,rb}') +
            Dir.glob('lib/**/*.rb')

  s.extensions << 'ext/phidget/extconf.rb'

  s.add_development_dependency 'rake-compiler'
end
