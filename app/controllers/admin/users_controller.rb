# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :admin_only
    helper_method :user

    def index
      @users = User.all.page(params[:page]).per(10)
    end

    def new
      @user = User.new
    end

    def edit; end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: t('create_succeed')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if user.update(user_params)
        redirect_to admin_users_path, notice: t('edit_succeed')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if User.where(authority: 'admin').count == 1 && user.admin?
        redirect_to admin_users_path, alert: t('cannot_delete_admin')
      else
        user.destroy
        redirect_to admin_users_path, notice: t('delete_succeed')
      end
    end

    def tasks
      @tasks = user.tasks
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :authority)
    end

    def user
      @user ||= User.find_by(id: params[:id])
    end

    def admin_only
      redirect_to root_path, alert: t('access_denied') unless current_user&.admin?
    end
  end
end
