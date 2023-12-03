BetterMailerPreviews::Engine.routes.draw do
  root to: 'mailers#index'

  get '/:mailer_name/:email_type', to: 'mailers#show', as: :mailer_preview
end
