class ProjectsController < ApplicationController
  include ProjectsHelper
  
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new params[:project]
    validate_new_project_and_save
  end

  def show
    get_project_with_id params[:id]
  end

  def edit
    get_project_with_id params[:id]
  end

  def update
    get_project_with_id params[:id]
    if @project.update_attributes params[:project]
      flash[:notice] = 'Project has been updated.'
      redirect_to @project
    else
      flash[:alert] = 'Project has not been updated.'
      render :action => 'edit'
    end
  end
end