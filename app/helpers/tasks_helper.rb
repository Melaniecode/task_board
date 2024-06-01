# frozen_string_literal: true

module TasksHelper
  def order_options
    [
      [I18n.t('order_options.id_desc'), 'id_desc'],
      [I18n.t('order_options.id_asc'), 'id_asc'],
      [I18n.t('order_options.created_at_desc'), 'created_at_desc'],
      [I18n.t('order_options.created_at_asc'), 'created_at_asc']
    ]
  end
end
