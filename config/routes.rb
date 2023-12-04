BetterMailerPreviews::Engine.routes.draw do
  root to: 'mailers#index'

  get '/:mailer_name/:email_type', to: 'mailers#show', as: :mailer_preview
  post '/:mailer_name/:email_type/send', to: 'mailers#send_email', as: :send_mailer_email
end
