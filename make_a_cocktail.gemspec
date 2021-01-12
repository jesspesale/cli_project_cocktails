require_relative 'lib/make_a_cocktail/version'

Gem::Specification.new do |spec|
  spec.name          = "make_a_cocktail"
  spec.version       = MakeACocktail::VERSION
  spec.authors       = ["Jess Pesale"]
  spec.email         = ["jess_pesale@aol.com"]

  spec.summary       = "CLI project for making cocktails"
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "pry"
  # spec.add_development_dependency 'nokogiri', '1.10.8'
  spec.add_development_dependency 'rspec'

  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "colorize"
  spec.add_dependency "nokogiri"
end
