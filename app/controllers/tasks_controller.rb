# frozen_string_literal: true

class TasksController < ApplicationController
  helper_method :task, :process_new_tags
  before_action :require_user_logged_in!

  def index
    @tasks = current_user.tasks.filter_by(params.slice(:status, :priority,
                                                       :title, :tag_ids)).order(sort_by).page(params[:page]).per(10)
  end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      process_new_tags
      redirect_to tasks_path, notice: t('create_succeed')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if task.update(task_params)
      process_new_tags
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
    params.require(:task).permit(:title, :content, :start_time, :end_time, :priority, :status, tag_ids: [])
  end

  def task
    @task ||= Task.find(params[:id])
  end

  def sort_by
    params[:sort_by] || 'id asc'
  end

  def process_new_tags
    new_tags = params[:task][:new_tags]
    return if new_tags.blank?

    new_tags.split(',').map(&:strip).each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      @task.tags << tag unless @task.tags.include?(tag)
    end
  end
end
