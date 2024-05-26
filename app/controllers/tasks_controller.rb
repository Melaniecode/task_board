class TasksController < ApplicationController
  def index
    @tasks = Task.order(:id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "Successfully added task!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: "Updated Successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end
end
