require "test_helper"

module BetterMailerPreviews
  class ApplicationHelperTest < ActionView::TestCase
    include ApplicationHelper

    class PreviewTextForURL < ActionView::TestCase
      test "generates correct preview text for URL" do
        url = "/rails/mailers/invoice_mailer/saas"
        expected = "Preview InvoiceMailer.Saas →"

        assert_equal expected, preview_text_for_url(url)
      end

      test "generates correct preview text for namespaced URL" do
        url = "/rails/mailers/test/test_mailer/github_test"
        expected = "Preview Test/TestMailer.GithubTest →"

        assert_equal expected, preview_text_for_url(url)
      end
    end

    class PreviewPathForURL < ActionView::TestCase
      test "generates correct preview path for URL" do
        url = "/rails/mailers/invoice_mailer/saas"
        expected = "/better_mailer_previews/invoice_mailer/saas"

        assert_equal expected, preview_path_for_url(url)
      end

      test "generates correct preview path for namespaced URL" do
        url = "/rails/mailers/test/test_mailer/github_test"
        expected = "/better_mailer_previews/test/test_mailer/github_test"

        assert_equal expected, preview_path_for_url(url)
      end
    end
  end
end
