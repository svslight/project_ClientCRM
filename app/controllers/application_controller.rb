# frozen_string_literal: true

class ApplicationController < ActionController::Base

  before_action :authenticate_user!, unless: :devise_controller?
  skip_before_action :authenticate_user!, :only => [:index, :show]

  # обработчик исключений: вызов стандартного сообщения
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to new_user_session_path, alert: exception.message }
      format.js { render nothing: true, status: :forbidden }
    end 
  end

  check_authorization unless: :devise_controller?
end
