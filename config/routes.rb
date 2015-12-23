Rails.application.routes.draw do


  scope "admin" do
    resources :users do
      member do
        get 'contacted'       => 'users#contacted', as: :contacted
      end
      collection do
        get 'sync_mailchimp'  => 'users#sync_mailchimp', as: :sync_mailchimp
      end
    end
    resources :groups, except: [:new, :create]
    get '/', to: redirect('/admin/users')
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
    patch 'settings/update_group/:id' => 'user_settings#update_group',          as: :user_update_group
    patch 'settings/remove_group/:id' => 'user_settings#remove_group',          as: :user_remove_group

    get 'about'                       => 'pages#about',                         as: :about
    get 'actions/gathering'           => 'actions#gathering',                   as: :actions_gathering
    get 'actions/com21'               => 'actions#com21',                       as: :actions_com21
    get 'actions/un-solutions-summit' => 'actions#un_solutions_summit',         as: :actions_un
    get 'solutions'                   => 'pages#solutions',                     as: :solutions
    get 'donations'                   => 'pages#donations',                     as: :donations
  end

  root to: 'landing_page#locale_redirect'
end
