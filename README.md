# Better Mailer Previews — A lightweight Rails engine for improved email previews.
Better Mailer Previews is a Ruby on Rails gem that makes previewing all your ActionMailer email templates easier. 

This gem/engine builds on top of native Rails mailer previews, with a few key enhancements like — 

- Shows _all_ your previews _live_ on the homepage
- Easily resize individual mailers, for testing responsive layouts

Watch the demo &darr;

<p align="center">
  <kbd>
    <img width=640 src="https://github.com/harrison-broadbent/better_mailer_previews/assets/5293153/437aaefc-a9f4-4bc1-8ac9-dd02e59cdcc9" />
  </kbd>
</p>

## Getting Started
Add this line to the development group in your application's Gemfile:

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

## How can I get previews to show up for my mailers? 

This engine will display all the [Actionmailer Previews](https://guides.rubyonrails.org/action_mailer_basics.html#previewing-emails) defined in the host Ruby on Rails app. These are the mailer previews you've defined in `test/mailers/previews`, for use with native [Actionmailer Previews](https://guides.rubyonrails.org/action_mailer_basics.html#previewing-emails). 

For all the mailers you'd like to preview, you need to set up the corresponding `ActionMailer::Preview` class. Once you've done that, this engine will automatically pull them all in and let you preview them!

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
