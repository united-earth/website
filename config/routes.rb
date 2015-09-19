Rails.application.routes.draw do
  get 'user_settings/index'

  scope "admin" do
    resources :users
    resources :groups, except: [:new, :create]
  end

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/, path_prefix: "/:locale" do
    devise_for :users, controllers: { registrations: 'registrations' }
    root 'landing_page#index',                                as: :landing_page
    get 'un-application'              => 'landing_page#un_application',         as: :un_application
    get 'settings'                    => 'user_settings#index',                 as: :user_settings
    post 'settings/user'              => 'user_settings#update_user',           as: :user_update
    get 'settings/personal_info'      => 'user_settings#personal_info',         as: :personal_info
    post 'settings/personal_info'     => 'user_settings#update_personal_info',  as: :update_personal_info
    get 'settings/new_group'          => 'user_settings#new_group',             as: :new_group
    post 'settings/new_group'         => 'user_settings#create_group',          as: :create_group
    get 'settings/edit_group/:id'     => 'user_settings#edit_group',            as: :user_edit_group
    post 'settings/update_group'      => 'user_settings#update_group',          as: :user_update_group
    patch 'settings/remove_group/:id' => 'user_settings#remove_group',          as: :user_remove_group
  end

  root to: 'landing_page#locale_redirect'
end
