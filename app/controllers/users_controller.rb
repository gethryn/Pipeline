class UsersController < ApplicationController
  

  def new
    @user = User.new(:time_zone => "Sydney")
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url 
    else
      render :action => 'edit'
    end
  end
end
