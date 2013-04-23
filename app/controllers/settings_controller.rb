class SettingsController < ApplicationController
  
  before_filter :require_user
  
  def index
    @settings = Setting.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @settings }
      format.xml { render :xml => @settings }
    end
    
  end
  
  #def admin_email
    
  #end
end
