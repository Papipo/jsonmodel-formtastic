# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "jsonmodel-formtastic"
  s.version     = Jsonmodel::Formtastic::VERSION
  s.authors     = ["Rodrigo Alvarez"]
  s.email       = ["papipo@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{This gem adds formtastic compatibility to JSONModel}
  s.description = %q{Just include it in your Gemfile and your JSONModels will quack as formtastic wants}

  s.rubyforge_project = "jsonmodel-formtastic"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "jsonmodel"
  s.add_runtime_dependency "formtastic"
end
