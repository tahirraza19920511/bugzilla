class BugsController < ApplicationController
	def index
    if (current_user.user_type == 'Qa')
    @bugs = Bug.all
    else
    redirect_to projects_path
  end
  end

  def new
    if (current_user.user_type == 'Qa')
        @bug=Bug.new
        else
    redirect_to projects_path
  end   
  end

  def show
    if (current_user.user_type == 'Qa')
        @bug =Bug.find(params[:id])
         else
    redirect_to projects_path
  end 
  end

  def create
     @bug=Bug.new(bug_params)
   @bug.creator_id = current_user.id
    if @bug.save
      flash[:notice]="Bug Added"
      redirect_to bugs_path
    else
      flash[:error]="Failed to edit Project"
      redirect_to new_bug_path
    end
    end

  def edit
     if (current_user.user_type == 'Qa')
     @bug = Bug.find(params[:id])
      else
    redirect_to projects_path
  end 
  end

  def update
     @bug = Bug.find(params[:id])
     if @bug.update_attributes(bug_params)
      flash[:notice]="Bug Updated"
      redirect_to bugs_path
      else
        flash[:error]="Failed to update Bug"
       redirect_to edit_bug
      end
  end

  def destroy
     if (current_user.user_type == 'Qa')
     @bug = Bug.find(params[:id])
    if @bug.delete
      flash[:notice]="Bug Deleted"
      redirect_to bugs_path
      else
      flash[:error]="Bug not Deleted"
      render :detroy
      end
       else
    redirect_to projects_path
  end 
  end
  
  def bug_params   
    params.require(:bug).permit(:title, :deadline, :screenshot, :types, :status, :user_id, :creator_id, :developer_id, :project_id)
  end

   def assignme
       @bug = Bug.find(params[:id])
       @bug = Bug.where(id: params[:id]).update(developer_id: current_user.id,status: 'started').first
       redirect_to bugs_path
  end
   def markup
       @bug = Bug.find(params[:id])
       if (@bug.types == 'feature')
       @bug = Bug.where(id: params[:id]).update(status: 'completed').first
       redirect_to bugs_path
     else
      @bug = Bug.where(id: params[:id]).update(status: 'resolved').first
       redirect_to bugs_path
     end
  end

end
