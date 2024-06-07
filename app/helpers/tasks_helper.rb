# frozen_string_literal: true

module TasksHelper
  def order_options
    [
      [I18n.t('order_options.id_desc'), 'id desc'],
      [I18n.t('order_options.id_asc'), 'id asc'],
      [I18n.t('order_options.created_at_desc'), 'created_at desc'],
      [I18n.t('order_options.created_at_asc'), 'created_at asc'],
      [I18n.t('order_options.end_time_desc'), 'end_time desc'],
      [I18n.t('order_options.end_time_asc'), 'end_time asc']
    ]
  end

  def status_i18n(status)
    I18n.t("activerecord.enums.task.statuses.#{status}")
  end

  def priority_i18n(priority)
    I18n.t("activerecord.enums.task.priorities.#{priority}")
  end

  def enum_options_i18n(enum_type)
    Task.public_send(enum_type).keys.map { |k| [I18n.t("activerecord.enums.task.#{enum_type}.#{k}"), k] }
  end
end
