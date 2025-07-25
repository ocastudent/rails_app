class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)

    if user.save
      redirect_to root_path
    else
      render :new
    end
  end


  def index
    @users = User.all
  end

  def show
    @user_show = User.find(params[:id])
  end
    
  def edit
    @user_edit = User.find(params[:id])
  end


def update
   user = User.find(params[:id])

   if user.update(user_params)
     redirect_to root_path
   else
     render :edit
   end
 end


 def destroy
   user = User.find(params[:id])
   user.destroy
   redirect_to root_path
 end

  private
  def user_params
    params.require(:user).permit(:first_name, :family_name)
  end

end
