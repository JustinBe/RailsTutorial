class ProjectsController < ApplicationController
  include ProjectsHelper

  before_filter :find_project, :only => [:show, :edit, :update, :destroy]
  
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
  end

  def edit
  end

  def update
    validate_edit_project_and_save params[:project]
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to projects_path
  end

private
  def get_project_with_id id
    @project = Project.find id
  end

  def find_project
    get_project_with_id params[:id]
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking" +
    " for could not be found."
    redirect_to projects_path
  end

  def validate_new_project_and_save
    if @project.save
      flash[:notice] = 'Project has been created.'
      redirect_to @project
    else
      flash[:alert] = 'Project has not been created.'
      render :action => 'new'
    end
  end

  def validate_edit_project_and_save project_to_edit
    if @project.update_attributes project_to_edit
      flash[:notice] = 'Project has been updated.'
      redirect_to @project
    else
      flash[:alert] = 'Project has not been updated.'
      render :action => 'edit'
    end
  end

end