# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = authenticate_user(params[:email], params[:password])
    if user
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
<<<<<<< HEAD

  private

  def authenticate_user(email, password)
    user = User.find_by(email:)
    user if user&.authenticate(password)
  end
=======
>>>>>>> e762710 (add user index)
end
