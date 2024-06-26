# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :set_current_user

  def switch_locale(...)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, ...)
  end

  def set_current_user
    return unless session[:user_id]

    Current.user = User.find_by(id: session[:user_id])
  end

  def require_user_logged_in!
    redirect_to log_in_path, alert: t('not_log_in') if Current.user.nil?
  end
end
