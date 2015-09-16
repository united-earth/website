Rails.application.routes.draw do

  scope "admin" do
    resources :users
  end

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/, path_prefix: "/:locale" do
    root 'landing_page#index',                              as: :landing_page
    get 'un-application' => 'landing_page#un_application',  as: :un_application
  end

  get '/' => 'landing_page#locale_redirect'
end
