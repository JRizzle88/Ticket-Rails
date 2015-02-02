class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_project

  respond_to :html

  def index
    @projects = Project.where(user_id: current_user.id)
    
    #@taskcount = @project.tasks.count
    @projectcount = @projects.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @projects }
      format.js # index.js.erb
    end
  end

  def show
    #logger.debug 'controller action show'
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @new_task = @project.tasks.new
    #respond_with(@project)
  end

  def new
    @project = Project.new
    #respond_with(@project)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, :notice => "Project Created."
    end
    puts @project.errors.inspect

    #respond_with(@project)
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path, :notice => "Project Updated."
    else
      redirect_to edit_project_path, :alert => "Unable to update project."
    end
  end

  def destroy
    @project = Project.find(project_params)
    @project.destroy
    redirect_to projects_path, :notice => "Project Deleted."
  end

  private

    def set_project
      #@project = Project.find(params[:id])
    end
    def task_params
      #params.require(:task).permit(:title, :project_id)
    end
    def project_params
      params.require(:project).permit(:name, :description, :due_date, :user_id, :project_id)
    end
end
