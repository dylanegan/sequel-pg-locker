# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sequel-pg-locker/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mark Fine", "Dylan Egan"]
  gem.email         = ["mark.fine@gmail.com", "dylanegan@gmail.com"]
  gem.description   = %q{Simple way to grab a lock using PostgreSQL.}
  gem.summary       = %q{Simple lock PostgreSQL.}
  gem.homepage      = "https://github.com/dylanegan/sequel-pg-locker"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "sequel-pg-locker"
  gem.require_paths = ["lib"]
  gem.version       = Sequel::Pg::Locker::VERSION

  gem.add_development_dependency "minitest", "~> 2.12"
  gem.add_development_dependency "rake", "~> 0.9"

  gem.add_runtime_dependency "pg", "~> 0.13"
  gem.add_runtime_dependency "sequel", "~> 3.34"
end
