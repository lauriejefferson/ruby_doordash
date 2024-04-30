# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/ruby_doordash/version"

Gem::Specification.new do |spec|
  spec.name = "ruby_doordash"
  spec.version = RubyDoordash::VERSION
  spec.authors = ["Laurie Jefferson"]
  spec.email = ["joyfulnoiseforyahshua@gmail.com"]

  spec.summary = "DoorDash API Ruby Gem."
  spec.description = "A Ruby interface to the DoorDash API."
  spec.homepage = "https://github.com/lauriejefferson/ruby_doordash"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lauriejefferson/ruby_doordash"
  spec.metadata["changelog_uri"] = "https://github.com/lauriejefferson/ruby_doordash/changelog"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "faraday", "~> 2.9"
  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
