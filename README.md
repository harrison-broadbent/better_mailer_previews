# Better Mailer Previews — A lightweight Rails engine for improved email previews.
Better Mailer Previews is a Ruby on Rails gem to make it easier to preview ActionMailer email templates. Live preview all your mails 

## Getting Started
Add this line to the development group in your your application's Gemfile:

```ruby
group :development do
  ...
  gem "better_mailer_previews"
end
```

And then execute:
```bash
$ bundle
```

Finally, you need to mount this engine in your `routes.rb` file — 

```ruby
# routes.rb

Rails.application.routes.draw do
  mount BetterMailerPreviews::Engine, at: "/better_mailer_previews" if Rails.env.development?
  ...
end
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
