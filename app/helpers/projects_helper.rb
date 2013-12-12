module ProjectsHelper
  def get_project_with_id id
    @project = Project.find id
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
end
