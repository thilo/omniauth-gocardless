# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth/gocardless/version"

Gem::Specification.new do |s|
  s.name = "omniauth-gocardless"
  s.summary = "OmniAuth strategy for GoCardless"
  s.email = "thilo@cobot.me"
  s.homepage = "http://github.com/cobot/omniauth-gocardless"
  s.description = "OmniAuth strategy for GoCardless"
  s.authors = ["Thilo Utke"]
  s.version     = OmniAuth::Gocardless::VERSION
  s.platform    = Gem::Platform::RUBY

  s.add_dependency 'omniauth-oauth2'

  s.add_development_dependency 'rake'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
end
