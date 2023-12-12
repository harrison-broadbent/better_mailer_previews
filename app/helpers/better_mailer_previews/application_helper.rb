module BetterMailerPreviews
  module ApplicationHelper
    def preview_text_for_url(url)
      return "Preview #{url.split("/")[-2...].map { |segment| segment.split("_").map(&:capitalize).join }.join(".")} →"
    end

    def preview_path_for_url(url)
      url.split("/")[-2...].join("/").prepend("#{BetterMailerPreviews::Engine.routes.find_script_name({})}/")
    end
  end
end
