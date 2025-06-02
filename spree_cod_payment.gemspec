# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_store_pickup/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_store_pickup'
  s.version     = SpreeStorePickup::VERSION
  s.summary     = 'Spree Commerce Store Pickup Extension'
  s.description = 'Adds in-store pickup as selectable shipping and payment option during checkout.'

  s.required_ruby_version = '>= 3.0'

  s.author    = 'OlympusOne'
  s.email     = 'info@olympusone.com'
  s.homepage  = 'https://github.com/olympusone/spree_store_pickup'
  s.license   = 'MIT'

  s.metadata = {
    "bug_tracker_uri"   => "#{s.homepage}/issues",
    "changelog_uri"     => "#{s.homepage}/releases/tag/v#{s.version}",
    "documentation_uri" => s.homepage,
    "homepage_uri"      => s.homepage,
    "source_code_uri"   => "#{s.homepage}/tree/v#{s.version}",
  }

  s.files        = Dir["{app,config,db,lib,vendor}/**/*", "LICENSE.md", "Rakefile", "README.md"].reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 5.0.4'
  s.add_dependency 'spree', spree_version
  s.add_dependency 'spree_storefront', spree_version
  s.add_dependency 'spree_admin', spree_version
  s.add_dependency 'spree_extension'

  s.add_development_dependency 'spree_dev_tools'
end
