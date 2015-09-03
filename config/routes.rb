Rails.application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/, path_prefix: "/:locale" do
    root 'landing_page#index',                  as: :landing_page
  end

  get '/' => 'landing_page#locale_redirect'
end
