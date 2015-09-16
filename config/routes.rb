Rails.application.routes.draw do
  scope "admin" do
    resources :users
  end

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/, path_prefix: "/:locale" do
    devise_for :users
    root 'landing_page#index',                              as: :landing_page
    get 'un-application' => 'landing_page#un_application',  as: :un_application
  end

  root to: 'landing_page#locale_redirect'
end
