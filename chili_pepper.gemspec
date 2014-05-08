$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chili_pepper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chili_pepper"
  s.version     = ChiliPepper::VERSION
  s.authors     = ["Loic Seigland"]
  s.email       = ["loic@loicseigland.ie"]
  s.homepage    = "http://loicseigland.ie"
  s.summary     = "Rapid Creation of CMS for restaurant websites."
  s.description = "Using in-place editing etc."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.4"
  s.add_dependency "acts_as_list", '~> 0.4.0'
  s.add_dependency 'friendly_id', '~> 5.0.0'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'sqlite3'

end
