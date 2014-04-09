class UsersController < ApplicationController
 #before_filter :authenticate_user!

  def index
    #authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end
  
  def show_members
    #authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.where(:user_type => 'Member')
  end

  def show_suppliers
    #authorize! :indsex, @user, :message => 'Not authorized as an administrator.'
    @users = User.where(:user_type => 'Supplier')
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def update
   # authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    
    user = User.find(params[:id])
    if user_signed_in? && current_user.user_type=="admin"
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Not authorized as an administrator."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  
end