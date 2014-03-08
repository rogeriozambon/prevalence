$:.push File.expand_path("../lib", __FILE__)
require "prevalence/version"

Gem::Specification.new do |s|
  s.name          = "prevalence"
  s.version       = Prevalence::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Rogério Zambon"]
  s.email         = ["rogeriozambon@gmail.com"]
  s.homepage      = "http://github.com/rogeriozambon/prevalence"
  s.summary       = "Concept implementation of the Prevalent System for Ruby."
  s.description   = s.summary
  s.license       = "MIT"
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "rake", ">= 10.1.0"
  s.add_development_dependency "rspec", ">= 2.14.0"
end
