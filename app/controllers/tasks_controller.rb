class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    # no need for app/views/restaurants/create.html.erb
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)

    # no need for app/views/tasks/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    # no need for app/views/tasks/destroy.html.erb
    redirect_to root_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
