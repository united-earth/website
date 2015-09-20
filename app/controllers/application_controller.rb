class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  before_filter :set_meta

  def set_submenu
    @has_submenu = true
  end


  private
  def set_locale
    I18n.locale = params[:locale]
  end

  def set_meta

    url = 'http://united-earth.vision'
    image = 'http://united-earth.vision/logo.png'
    if Rails.env == 'staging' || Rails.env == 'development'
      url = 'http://staging.united-earth.vision'
      image = 'http://staging.united-earth.vision/logo.png'
    end
    set_meta_tags title: 'United Earth',
                  description: 'United Earth extends a planetary invitation to all life-affirming persons and groups to unite and collaborate for a whole-systems transformation of human society.',
                  keywords: 'United, Earth, Co-creation, Unity, Collaboration, Transformation, Whole-System'

    set_meta_tags og: {
                      title:    'United Earth',
                      url:      url,
                      image:    image,
                      description: 'United Earth extends a planetary invitation to all life-affirming persons and groups to unite and collaborate for a whole-systems transformation of human society.'
                  }
  end
end
