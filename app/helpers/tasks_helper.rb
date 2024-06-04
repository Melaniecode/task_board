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

  def task_priority(task)
    Task.human_attribute_name [:priority, task.priority].join('.')
  end

  def task_status(task)
    Task.human_attribute_name [:status, task.status].join('.')
  end
end
