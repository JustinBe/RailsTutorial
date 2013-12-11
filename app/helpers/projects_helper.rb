module ProjectsHelper
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
