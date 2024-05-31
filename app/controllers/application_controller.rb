# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # callback 方法，你在執行特定 action 的前後執行這個方法
  around_action :switch_locale

  def switch_locale(&action)
    # 使用指定的語言，或者是，預設的語言
    locale = params[:locale] || I18n.default_locale
    # 在執行每個 action 時，將指定的語言區域應用到該 action 中。
    I18n.with_locale(locale, &action)
  end
end
