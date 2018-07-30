class ProjectsController < ApplicationController
  
  def index
    if (current_user.user_type == 'Manager')
    @projects = Project.where(user_id: current_user.id)
  else
     @projects = current_user.projects
  end
  end

  def edit
    if (current_user.user_type == 'Manager')
  	@project = Project.find(params[:id])
     @users = User.all
      @users = User.where. not(user_type: 'Manager')
     else
    redirect_to projects_path
  end
  end

  def show 
  	@project = Project.find(params[:id])
  end

  def new
    if (current_user.user_type == 'Manager')
  	@project = Project.new
    @project.user_projects.new
    @users = User.all
    @users = User.where. not(user_type: 'Manager')
     else
    redirect_to projects_path
  end
  end

  def create
  	@project = Project.new(project_params)
    @project.user_id = current_user.id
    authorize @project
  	if @project.save
  		flash[:notice]="Project Added"
      redirect_to projects_path
    else
    	flash[:error]="Failed to edit Project"
      render new_project_path
  end
  end

  def update
     if (current_user.user_type == 'Manager')
  	@project = Project.find(params[:id])
  	if @project.update_attributes(project_params)
  	flash[:notice]="Project Updated"
  		redirect_to projects_path
  	else
  		flash[:error]="Failed to update Project"
  		render :edit
  end	
   else
    redirect_to projects_path
  end
  end

  def destroy
    if (current_user.user_type == 'Manager')
    @userproject = UserProject.where(project_id: params[:id]).destroy_all
  	@project = Project.find(params[:id])
  	if @project.destroy
  	flash[:notice]="Project Deleted"
  	redirect_to projects_path
  	else
  		flash[:error]="Project not Deleted"
  		render :detroy
  	end
     else
    redirect_to projects_path
  end
  end

 def project_params
 	params.require(:project).permit(:id, :title, :description, :user_id, user_projects_attributes:[:id,:user_id])
end

end