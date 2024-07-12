# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from StandardError, with: :server_error

  around_action :switch_locale
  before_action :current_user

  def switch_locale(&)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def require_user_logged_in!
    redirect_to log_in_path, alert: t('not_log_in') unless current_user
  end

  private

  def not_found
    render 'errors/not_found'
  end

  def unprocessable_entity
    render 'errors/unprocessable_entity'
  end

  def server_error
    render 'errors/server_error'
  end
end
