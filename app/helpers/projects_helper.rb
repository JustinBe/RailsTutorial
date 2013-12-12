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
