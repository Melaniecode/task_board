# frozen_string_literal: true

# available to all views in the application.
module ApplicationHelper
  def form_field_with_errors(form, field, &block)
    content_tag(:div) do
      concat form.label(field, class: "block text-gray-700 font-bold mb-2")
      concat capture(&block)
      if form.object.errors[field].any?
        concat content_tag(:p, form.object.errors[field].join(', '), class: "text-red-500 text-xs")
      end
    end
  end
end
