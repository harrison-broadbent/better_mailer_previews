module BetterMailerPreviews
  class MailersController < ActionController::Base
    layout "better_mailer_previews/application"

    def index
      preview_emails_to_render = ActionMailer::Preview.all.map do |preview|
        { preview: preview, emails: preview.emails }
      end

      @urls_by_mailer = {}
      preview_emails_to_render.each do |entry|
        mailer_name = entry[:preview].name.underscore.gsub("_preview", "")
        urls = entry[:emails].map do |email|
          email_name = email.underscore
          "/rails/mailers/#{mailer_name}/#{email_name}"
        end
        @urls_by_mailer[mailer_name] = urls
      end
    end

    def show
      @mailer_path = params[:mailer_path]
      @email_type = params[:email_type]
      @email_address = cookies[:better_mailer_previews_email_address]

      # construct URL for <iframe>, passing through any query params
      @url_for_mailer = "/rails/mailers/#{@mailer_path}/#{@email_type}"
      @url_for_mailer += "?#{request.query_string}" unless request.query_string.empty?
    end

    def send_email
      # mailer_path: underscore_case of base mailer path | test/invoice_mailer
      # email_type: string mailer method to call on class | "round"
      # email_address: string email address to send to | "test@t.com"
      mailer_path = params[:mailer_path]
      email_type = params[:email_type]
      email_address = params[:email_address]

      # save email in a cookie so we can re-populate the form
      cookies[:better_mailer_previews_email_address] = email_address

      # Instantiate the preview class (ie: InvoiceMailerPreview),
      # then render it's preview html into a string.
      preview_class_string = mailer_path.split("/").map(&:camelize).join("::").concat("Preview")
      preview_class = preview_class_string.constantize

      preview_method = email_type.to_sym
      mail = preview_class.new.public_send(preview_method).message
      html_content = mail.body.decoded

      # Send the string we just rendered, to the email from the form submission.
      ActionMailer::Base.mail(
        content_type: "text/html",
        from: "better-mailer-previews@railsnotes.xyz",
        to: email_address,
        subject: "#{preview_class_string}.#{preview_method} (via BetterMailerPreviews)",
        body: html_content,
      ).deliver_now

      flash[:notice] = "sent to #{email_address} (via #{Rails.application.config.action_mailer.delivery_method})"
      redirect_back(fallback_location: root_path)
    end
  end
end
