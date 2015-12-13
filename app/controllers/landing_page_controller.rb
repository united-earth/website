class LandingPageController < ApplicationController
  def locale_redirect
    locale = http_accept_language.compatible_language_from(I18n.available_locales)
    redirect_to landing_page_path(locale: locale || :en)
  end

  def index
    @at_landing = true
    @groups = Group.all.active
    @number_of_all_users = User.all.size
    @users = User.all.voice_added
  end

end
