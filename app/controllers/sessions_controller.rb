# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: t('log_in_succeed')
    else
      flash[:alert] = t('invalid_log_in')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path, notice: t('log_out_succeed')
  end
end
