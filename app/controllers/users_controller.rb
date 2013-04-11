class UsersController < ApplicationController
   before_filter :require_no_user, :only => [:new, :create]
   before_filter :require_user, :only => [:show, :edit, :update, :role_user_list, :update_user_role]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.valid_with_captcha?
      if @user.save
        flash[:notice] = "Your account has been created."
        redirect_to signup_url
      end
    else
      flash[:notice] = "There was a problem creating you."
      render :action => :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def role_user_list
    @users = User.all
    @roles = Role.all
  end
  
  def update_user_role
    
    @user = User.find(params[:user_id])
    if @user.update_attribute('role_id', params[:role_id])
      status = { :status => true, :message => "Updated", :html => '<i class="icon-ok-sign icon-black"></i> '}
    else
      status = { :status => false, :message => "Failed", :html => '<i class="icon-minus-sign icon-black"></i> '}
    end
    
    respond_to do |format|
      format.json { render json: status }
    end
  end
  
  
end
