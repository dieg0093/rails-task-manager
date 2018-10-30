class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(user_params)
    @task.save
    redirect_to tasks_path
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def update
    @task = Task.find(params[:id])
    @task.update(user_params)
    redirect_to tasks_path
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path

  end

  private

  def user_params
    params.require(:task).permit(:title, :details)
  end
end
