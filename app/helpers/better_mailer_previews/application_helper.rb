module BetterMailerPreviews
  module ApplicationHelper

    # For generating mailer preview link names on mailers/index
    #
    # input: "/rails/mailers/invoice_mailer/saas"
    # output: "Preview InvoiceMailer.SaaS →"
    #
    def preview_text_for_url(url)
      pretty_mailer_preview_name = url.split("/")[-2...].map { |segment| segment.split("_").map(&:capitalize).join }.join(".")
      return "Preview #{pretty_mailer_preview_name} →"
    end

    # For generating mailer preview link paths on mailers/index
    #
    # input: "/rails/mailers/invoice_mailer/saas"
    # output: /better_mailer_previews/invoice_mailer/basic
    #
    def preview_path_for_url(url)
      mounted_engine_path = BetterMailerPreviews::Engine.routes.find_script_name({})
      url.split("/")[-2...].join("/").prepend("#{mounted_engine_path}/")
    end
  end
end
