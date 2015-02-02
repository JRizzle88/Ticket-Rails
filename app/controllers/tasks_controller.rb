class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_task
  before_filter :find_project

  respond_to :html, :js
  #def show
  #  @project = Project.find(params[:id])
  #end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      @new_task = @project.tasks.new
      respond_to do |format|
        format.html do
          flash[:notice] = "task posted."
          #redirect_to @project
          render :partial => "/tasks/task"
        end
        format.js # Javascript response
      end
    else
      @new_task = @task
      respond_to do |format|
        format.html { render @project }
        format.js { render action: 'failed_save' }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @project = @task.project
    @task.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = "task deleted."
        redirect_to @project
      end
      format.js # Javascript response
    end
  end

  def toggle
    @task = Task.find(params[:id])
    respond_to do |format|
      format.js do
        if (@task.state != true)
          @task.state = true
        else
          @task.state = false
        end
        @task.save
        render :layout => false
      end
    end
  end

  private

  def set_task
    #@task = Task.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def task_params
      params.require(:task).permit(:title)
  end

end
