# frozen_string_literal: true

class TasksController < ApplicationController
  helper_method :task
  before_action :require_user_logged_in!

  def index
    @tasks = current_user.tasks.filter_by(params.slice(:status, :priority,
                                                       :title)).order(sort_by).page(params[:page]).per(10)
  end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: t('create_succeed')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if task.update(task_params)
      redirect_to tasks_path, notice: t('edit_succeed')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    task.destroy
    redirect_to tasks_path, notice: t('delete_succeed')
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :start_time, :end_time, :priority, :status)
  end

  def task
    @task ||= Task.find_by(id: params[:id])
  end

  def sort_by
    params[:sort_by] || 'id asc'
  end
end
