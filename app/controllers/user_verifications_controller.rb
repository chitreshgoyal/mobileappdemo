class UserVerificationsController < ApplicationController
   before_filter :load_user_using_perishable_token, :only => [:show]

  def show
    if @user
      @user.verify!
      flash[:notice] = "Thank you for verifying your account. You may now login."
    else
      flash[:notice] = "Verification link expired or already used."
    end
    redirect_to root_url
  end

  private

  def load_user_using_perishable_token
    @user = User.find_by_perishable_token(params[:id])
    flash[:notice] = "Unable to find your account." unless @user
  end


end
