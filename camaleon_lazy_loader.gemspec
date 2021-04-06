$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "camaleon_lazy_loader/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = "camaleon_lazy_loader"
  spec.version = CamaleonLazyLoader::VERSION
  spec.authors = ["Brian Kephart"]
  spec.email = ["briantkephart@gmail.com"]
  spec.homepage = "https://github.com/brian-kephart/camaleon_lazy_loader"
  spec.summary = 'Adds browser-native loading="lazy" attribute to images and iframes rendered by Camaleon CMS.'
  spec.description = 'Adds browser-native loading="lazy" attribute to images and iframes rendered by Camaleon CMS.'
  spec.license = "MIT"
  spec.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.required_ruby_version = ">= 2.6"

  spec.add_dependency "camaleon_cms", "~> 2.0"
  spec.add_dependency "rails", ">= 5.2"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "standard"
end
