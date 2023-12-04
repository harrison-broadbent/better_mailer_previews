# Better Mailer Previews — A lightweight Rails engine for improved email previews.

Better Mailer Previews is a Ruby on Rails gem that **makes previewing all your ActionMailer email templates easier.**

This gem/engine builds on top of native Rails mailer previews, with a few key enhancements like —

- **Shows _all_ your previews _live_ on the homepage**
- **Easily resize individual mailers, for testing responsive layouts**
- **Fully compatible with, and can live alongside, native [Rails ActionMailer Previews](https://guides.rubyonrails.org/action_mailer_basics.html#previewing-emails)**

Here's a little demo I've put together &darr;

<p align="center">
  <kbd>
    <img width=640 src="https://github.com/harrison-broadbent/better_mailer_previews/assets/5293153/07f8ee5c-2363-4d73-a3d6-00376a2d2c6e" />
  </kbd>
</p>

## Why did I build this?

I've used native Rails mailer previews extensively for building my [ActionMailer email templates](https://railsnotesui.xyz), but they're pretty barebones and lacking. In particular, I wanted a way to bulk-preview templates (rather than checking them one by one). I also wanted to be able to easily resize the email container for testing responsive layouts.

This gem is my idea brought to life, and I hope you'll find it useful!

## Getting Started

1. Add this line to the development group in your application's Gemfile:

```ruby
group :development do
  ...
  gem "better_mailer_previews"
end
```

2. And then execute:

```bash
$ bundle
```

3. Finally, you need to mount this engine in your `routes.rb` file —

```ruby
# routes.rb

Rails.application.routes.draw do
  mount BetterMailerPreviews::Engine, at: "/better_mailer_previews" if Rails.env.development?
  ...
end
```

4. Run your Rails app, and visit `localhost:3000/better_mailer_previews`.
5. Profit ✨

## Sending email previews to an email address

This gem let's you send your email previews to an email address, using whatever default delivery method you have configured.

Better Mailer Previews sends it's emails using whichever `config.action_mailer.delivery_method` is defined for the environment. For example, if you're using [Mailhog](https://github.com/mailhog/MailHog) in development to test your emails, you might have a configuration like this —

```ruby
# config/environments/development.rb
#
Rails.application.configure do
  ...
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {address: "127.0.0.1", port: 1025}
  config.action_mailer.raise_delivery_errors = false
end
```

In this case, Better Mailer Previews will send it's emails to Mailhog too (since it uses your existing configuration). If you want to send emails to a _live_ inbox (like your personal email), you'd need to configure a live delivery method for the current environment.

## How can I get previews to show up for my mailers?

This engine will display all the [Actionmailer Previews](https://guides.rubyonrails.org/action_mailer_basics.html#previewing-emails) defined in the host Ruby on Rails app. These are the mailer previews you've defined in `test/mailers/previews`, for use with native [Actionmailer Previews](https://guides.rubyonrails.org/action_mailer_basics.html#previewing-emails).

For all the mailers you'd like to preview, you need to set up the corresponding `ActionMailer::Preview` class. Once you've done that, this engine will automatically pull them all in and let you preview them!

## Other things to note

- You need an internet connection for this to engine to work properly. This engine tries to load the TailwindCSS package via a CDN, to handle the app styling. Your browser will cache the package after you first download it though, which is handy.

## More from me

If you like this gem, you'll probably like some of my other work (all Ruby on Rails stuff) —

- [RailsNotes, my Ruby on Rails blog](https://railsnotes.xyz)
- [My Ruby on Rails Newsletter](https://railsnotes.xyz/newsletter)
- [RAILSG, a command builder for Rails generator commands](https://railsg.xyz)
- [RailsNotes UI, a library of ActionMailer email templates and components](https://railsnotesui.xyz)

If you want updates, you can also [follow me on Twitter](https://twitter.com/hrrsnbbnt)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
