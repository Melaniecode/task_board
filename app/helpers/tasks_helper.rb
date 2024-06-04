# frozen_string_literal: true

module TasksHelper
  def order_options
    [
      [I18n.t('order_options.id_desc'), 'id desc'],
      [I18n.t('order_options.id_asc'), 'id asc'],
      [I18n.t('order_options.created_at_desc'), 'created_at desc'],
      [I18n.t('order_options.created_at_asc'), 'created_at asc']
    ]
  end
end
