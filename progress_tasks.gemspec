# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'progress_tasks/version'

Gem::Specification.new do |spec|
  spec.name          = "progress_tasks"
  spec.version       = ProgressTasks::VERSION
  spec.authors       = ["Ariel Scherman"]
  spec.email         = ["arielscherman@gmail.com"]

  spec.summary       = %q{Gem that allows to execute long-running tasks while notifying an object with the progress.}
  spec.description   = %q{Gem that allows to execute long-running tasks while notifying an object with the progress.}
  spec.homepage      = "https://github.com/arielscherman/progress_tasks"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
