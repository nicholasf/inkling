class Inkling::Users::SessionsController < Devise::SessionsController

  layout nil
  
  after_filter :log, :only => [:create]
  before_filter :log, :only => [:destroy]
  
  private
  
  def log
    if params[:action] == "create"
      Inkling::Log.create!(:user => current_inkling_user, :text => "#{current_inkling_user.email} signed in.")
    elsif params[:action] == "destroy"
      Inkling::Log.create!(:user => current_inkling_user, :text => "#{current_inkling_user.email} signed out.")      
    end
  end
end