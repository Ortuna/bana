#!/usr/bin/env gem build
# encoding: utf-8

require File.expand_path("../lib/bana/version.rb", __FILE__)

Gem::Specification.new do |s|
  s.name = "bana"
  s.authors = ["Sumeet Singh"]
  s.email = "ortuna@gmail.com"
  s.summary = "Convert a Bana structure to multiple book formats"
  s.homepage = "http://www.github.com/ortuna/bana"
  s.description = "Convert a Bana structure to multiple book formats"
  s.required_rubygems_version = ">= 1.3.6"
  s.version = Bana.version
  s.date = Time.now.strftime("%Y-%m-%d")

  s.extra_rdoc_files = Dir["*.rdoc"]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.rdoc_options  = ["--charset=UTF-8"]

  s.add_runtime_dependency("pandoc-ruby", "~> 0.7.0")
  s.add_development_dependency("minitest", "~> 5.0")
end
