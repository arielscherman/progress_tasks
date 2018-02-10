$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "progress_tasks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "progress_tasks"
  s.version     = ProgressTasks::VERSION
  s.authors     = ["Ariel Scherman"]
  s.email       = ["arielscherman@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ProgressTasks."
  s.description = "TODO: Description of ProgressTasks."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.2"

  s.add_development_dependency "sqlite3"
end
