class RolesController < ApplicationController
   before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy, :set_permission]

  def index
    @roles = Role.all
  end
  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the role has not yet been activated
    if @role.save
        flash[:notice] = "Role has been created."
        redirect_to roles_url
    else
      flash[:notice] = "There was a problem creating new role."
      render :action => :new
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to roles_url, notice: 'Role was successfully updated.' }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @role = Role.find(params[:id])
    
    @role.destroy
       
    respond_to do |format|
        format.html { redirect_to roles_url, notice: 'Role was successfully deleted.' }
        format.json { head :no_content }
    end
      
  end
  
  def set_permission
    @roles = Role.all
    @features = Feature.all
    
  end
  
  def update_multiple
   #render :text=>'<pre>'+params[:roles].to_yaml and return
    params[:roles] = {} unless params.has_key?(:roles) # if all checkboxes unchecked.
    Role.all.each do |role|
      # this allows for 0 permission checkboxes being checked for a role.
      unless params[:roles].has_key?(role.id.to_s)
        params[:roles][role.id] = { feature_ids: [] }
      end
    end

    @permissions = Role.update(params[:roles].keys, params[:roles].values)
    
    @permissions.reject! { |r| r.errors.empty? }
    if @permissions.empty?
      redirect_to set_permission_path, notice: 'Roles permissions updated successfully.'
    else
      render :set_permission
    end
  end
  
end
