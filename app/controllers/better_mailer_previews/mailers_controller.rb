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

    def send_email
      # mailer_name: underscore_case of base mailer name | invoice_mailer
      # email_type: string mailer method to call on class | "round"
      # email_address: string email address to send to | "test@t.com"
      mailer_name = params[:mailer_name]
      email_type = params[:email_type]
      email_address = params[:email_address]

      # Instantiate the preview class (ie: InvoiceMailerPreview),
      # then render it's preview html into a string.
      preview_class = mailer_name.concat("_preview").camelize.constantize
      preview_method = email_type.to_sym
      mail = preview_class.new.public_send(preview_method).message
      html_content = mail.body.decoded

      # Send the string we just rendered, to the email from the form submission.
      ActionMailer::Base.mail(
        content_type: "text/html",
        from: "better-mailer-previews@railsnotes.xyz",
        to: email_address,
        subject: "#{preview_class.to_s}.#{preview_method} (via BetterMailerPreviews)",
        body: html_content,
      ).deliver_now

      flash[:notice] = "sent #{preview_class.to_s}.#{preview_method} to #{email_address} [via #{Rails.application.config.action_mailer.delivery_method}]"
      redirect_back(fallback_location: root_path)
    end
  end
end
