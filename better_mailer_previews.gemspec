require_relative "lib/better_mailer_previews/version"

Gem::Specification.new do |spec|
  spec.name        = "better_mailer_previews"
  spec.version     = BetterMailerPreviews::VERSION
  spec.authors     = ["Harrison Broadbent"]
  spec.email       = ["harrison@railsnotes.xyz"]
  spec.homepage    = "https://github.com/harrison-broadbent/better_mailer_previews"
  spec.summary     = "Better Mailer Previews is a Ruby on Rails gem that makes it easier to preview ActionMailer email templates."
  spec.description = "Better Mailer Previews is a Ruby on Rails gem that makes it easier to preview ActionMailer email templates."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "https://example.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.2"
end
