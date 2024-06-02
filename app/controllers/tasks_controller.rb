# frozen_string_literal: true

# Controller responsible for managing tasks in the application.
class TasksController < ApplicationController
  helper_method :task

  def index
    @tasks = sorted_tasks
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

  def sorted_tasks
    case params[:sort_by]
    when 'id_asc'
      Task.order(id: :asc)
    when 'id_desc'
      Task.order(id: :desc)
    when 'created_at_asc'
      Task.order(created_at: :asc)
    when 'created_at_desc'
      Task.order(created_at: :desc)
    else
      Task.all
    end
  end
end
