BetterMailerPreviews::Engine.routes.draw do
  root to: "mailers#index"

  # Wildcard routes to handle namespaced mailers
  get "/*mailer_path/:email_type", to: "mailers#show", as: :mailer_preview
  post "/*mailer_path/:email_type/send", to: "mailers#send_email", as: :send_mailer_email
end
