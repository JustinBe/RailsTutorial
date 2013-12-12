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

    validate_edit_project_and_save params[:project]
  end

  def destroy
    get_project_with_id params[:id]
    @project.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to projects_path
  end
end