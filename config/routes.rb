Rails.application.routes.draw do
  get 'user_settings/index'

  scope "admin" do
    resources :users
    resources :groups
  end

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/, path_prefix: "/:locale" do
    devise_for :users, controllers: { registrations: 'registrations' }
    root 'landing_page#index',                                as: :landing_page
    get 'un-application'              => 'landing_page#un_application',         as: :un_application
    get 'settings'                    => 'user_settings#index',                 as: :user_settings
    post 'settings/user'              => 'user_settings#update_user',           as: :user_update
    post 'settings/personal_info'     => 'user_settings#update_personal_info',  as: :personal_info
  end

  root to: 'landing_page#locale_redirect'
end
