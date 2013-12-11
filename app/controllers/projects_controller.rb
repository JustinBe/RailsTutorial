class ProjectsController < ApplicationController
  include ProjectsHelper
  
  def index

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new params[:project]
    validate_new_project_and_save
  end

  def show
    @project = Project.find params[:id]
  end
end