class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_permitted_params)
    @task.save
    redirect_to(tasks_path(@tasks))
  end

  def show
    id = params[:id]
    @tasks = Task.find(id)
  end

  def edit
    id = params[:id]
    @task = Task.find(id)
    @task.save
  end

  def update
    id = params[:id]
    @task = Task.find(id)
    @task.update(task_permitted_params)
    redirect_to(tasks_path(@tasks))
  end

  def destroy
    id = params[:id]
    @task = Task.find(id)
    @task.delete
    redirect_to tasks_path
  end

  private

  def task_permitted_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
