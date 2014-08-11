$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chili_pepper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chili_pepper"
  s.version     = ChiliPepper::VERSION
  s.authors     = ["Loic Seigland"]
  s.email       = ["loic@loicseigland.ie"]
  s.homepage    = ""
  s.summary     = "Rapid Creation of CMS for restaurant websites."
  s.description = "Using in-place editing etc."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails', '~> 4.1'
  s.add_dependency 'jquery-rails', '~> 3.1.1'
  s.add_dependency 'jquery-ui-rails', '~> 5.0.0'
  s.add_dependency 'coffee-rails', '~> 4.0.1'
  s.add_dependency 'acts_as_list', '~> 0.4.0'
  s.add_dependency 'friendly_id', '~> 5.0.0'
  s.add_dependency 'devise', '~> 3.2'
  s.add_dependency 'paperclip', '~> 4.1'
  s.add_dependency 'haml-rails', '~> 0.5.3'
  s.add_dependency 'simple_form', '~> 3.0'
  s.add_dependency 'draper', '~> 1.3'
  s.add_dependency 'redcarpet', '~>3.1'
  s.add_dependency 'rails3-jquery-autocomplete', '~> 1.0.14'

  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'launchy'

end
