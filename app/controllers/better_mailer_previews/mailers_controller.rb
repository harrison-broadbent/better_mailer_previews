module BetterMailerPreviews
  class MailersController < ActionController::Base
    layout "better_mailer_previews/application"

    def index
      mailer_previews = ActionMailer::Preview.all
      preview_emails = mailer_previews.map do |preview|
        { preview: preview, emails: preview.emails }
      end

      @urls_by_mailer = {}
      preview_emails.each do |entry|
        mailer_name = entry[:preview].name.underscore.gsub("_preview", "")
        urls = entry[:emails].map do |email|
          email_name = email.underscore
          "/rails/mailers/#{mailer_name}/#{email_name}"
        end
        @urls_by_mailer[mailer_name] = urls
      end
    end

    def show
      @mailer_name = params[:mailer_name]
      @email_type = params[:email_type]

      @url_for_mailer = "/rails/mailers/#{@mailer_name}/#{@email_type}"
    end
  end
end
