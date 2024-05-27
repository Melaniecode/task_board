class TasksController < ApplicationController
  helper_method :task

  def index
    @tasks = Task.order(:id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "Successfully Added Task!"
    else
      render :new, status: :unprocessable_entity #422
    end
  end

  def edit; end

  def update
    if task.update(task_params)
      redirect_to tasks_path, notice: "Updated Successfully!"
    else
      render :edit, status: :unprocessable_entity #422
    end
  end

  def destroy
    task.destroy
    redirect_to tasks_path, notice: "Deleted Successfully!"
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def task
    @task ||= Task.find_by(id: params[:id])
  end

end
