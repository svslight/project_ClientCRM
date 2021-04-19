# frozen_string_literal: true

class ApplicationController < ActionController::Base

  before_action :authenticate_user!, unless: :devise_controller?
  skip_before_action :authenticate_user!, :only => [:index, :show]
  
  check_authorization unless: :devise_controller?

  # обработчик исключений: вызов стандартного сообщения 
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
