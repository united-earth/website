class LandingPageController < ApplicationController
  def locale_redirect
    redirect_to landing_page_path(locale: http_accept_language.compatible_language_from(I18n.available_locales))
  end

  def index
    @at_landing = true
  end

end
