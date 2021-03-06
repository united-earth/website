class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  before_filter :set_meta
  before_filter :set_users_groups

  def set_submenu
    @has_submenu = true
  end


  private
  def set_locale
    I18n.locale = params[:locale]
  end

  def set_users_groups
    @groups = Group.all.active
    @number_of_all_users = User.all.size
    @users = User.all.voice_added
  end

  def set_meta

    url = 'https://united-earth.vision/en'
    image = 'https://united-earth.vision/logo.png'
    if Rails.env == 'staging' || Rails.env == 'development'
      url = 'http://staging.united-earth.vision'
      image = 'http://staging.united-earth.vision/logo.png'
    end
    set_meta_tags title: 'United Earth',
                  description: 'We are co-creating the framework of an open, inclusive, equality-based and solutions-oriented global platform for all people and groups wishing to unite and collaborate towards a whole-systems transformation of human society.',
                  keywords: 'United, Earth, Co-creation, Unity, Collaboration, Transformation, Whole-System'

    set_meta_tags og: {
                      title:    'United Earth',
                      url:      url,
                      image:    image,
                      description: 'We are co-creating the framework of an open, inclusive, equality-based and solutions-oriented global platform for all people and groups wishing to unite and collaborate towards a whole-systems transformation of human society.'
                  }
  end
end
