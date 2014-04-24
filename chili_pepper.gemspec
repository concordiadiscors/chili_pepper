$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chili_pepper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chili_pepper"
  s.version     = ChiliPepper::VERSION
  s.authors     = ["TODO: Loic Seigland"]
  s.email       = ["TODO: loic@loicseigland"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ChiliPepper."
  s.description = "TODO: Description of ChiliPepper."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.4"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "poltergeist"
  s.add_development_dependency "factory_girl_rails"

  s.add_development_dependency "sqlite3"
end
