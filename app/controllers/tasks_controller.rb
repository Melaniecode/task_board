# frozen_string_literal: true

# Controller responsible for managing tasks in the application.
class TasksController < ApplicationController
  helper_method :task

  def index
    @tasks = Task.where(nil)
    @tasks = @tasks.title_search(params[:title]) if params[:title].present?
    # @tasks = @tasks.status_search(params[:status]) if params[:status].present?
    @tasks = @tasks.order(sort_by)
  end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)

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
