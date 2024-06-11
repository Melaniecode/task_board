# frozen_string_literal: true

module UsersHelper
  def authority_options_for_select
    User.authorities.keys.map do |authority|
      [I18n.t("activerecord.enums.user.authorities.#{authority}"), authority]
    end
  end
end
