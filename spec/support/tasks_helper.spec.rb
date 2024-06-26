# frozen_string_literal: true

module TasksHelper
  def click_order_option(column, row)
    within('.sort-form') do
      select(I18n.t("order_options.#{column}_#{row}"), from: 'sort_by')
    end
    click_on I18n.t('tasks.index.confirm')
  end
end
