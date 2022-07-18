require_relative 'lib/rubocop/fairmoney/version'

Gem::Specification.new do |spec|
  spec.name          = "rubocop-fairmoney"
  spec.version       = RuboCop::Fairmoney::VERSION
  spec.authors       = ["Matthieu Gendreau"]
  spec.email         = ["matthieu+github@predictus.io"]

  spec.summary       = "Custom code style checking for FairMoney."
  spec.description   = <<-EOF
    A plugin for RuboCop code style enforcing & linting tool. It includes Rubocop configuration
    used at FairMoney.
  EOF
  spec.homepage      = "https://fairmoney.ng/"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata['allowed_push_host'] = 'https://rubygems.pkg.github.com'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fairmoney/rubocop-fairmoney"
  spec.metadata["changelog_uri"] = "https://github.com/fairmoney/rubocop-fairmoney/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rubocop'
  spec.add_runtime_dependency 'rubocop-performance'
  spec.add_runtime_dependency 'rubocop-rails'
  spec.add_runtime_dependency 'rubocop-rake'
  spec.add_runtime_dependency 'rubocop-rspec'
  spec.add_runtime_dependency 'rubocop-thread_safety'
end

