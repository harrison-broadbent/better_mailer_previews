require_relative "lib/better_mailer_previews/version"

Gem::Specification.new do |spec|
  spec.name        = "better_mailer_previews"
  spec.version     = BetterMailerPreviews::VERSION
  spec.authors     = ["Harrison Broadbent"]
  spec.email       = ["harrisonbroadbent@gmail.com"]
  spec.homepage    = "https://example.com"
  spec.summary     = "Summary of BetterMailerPreviews."
  spec.description = "Description of BetterMailerPreviews."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://example.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://example.com"
  spec.metadata["changelog_uri"] = "https://example.com"
  # spec.metadata["source_code_uri"] = "Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.2"
end
