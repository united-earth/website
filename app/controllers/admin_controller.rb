class AdminController < ApplicationController
  layout 'admin'
  before_filter :ensure_login

  private

  def ensure_login
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_ADMIN_NAME'] && password == ENV['BASIC_ADMIN_PASSWORD']
    end
  end
end