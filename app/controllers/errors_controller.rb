# frozen_string_literal: true

class ErrorsController < ApplicationController
  layout 'error'

  def not_found
    render status: :not_found
  end

  def unprocessable_entity
    render status: :unprocessable_entity
  end

  def server_error
    render status: :internal_server_error
  end
end
