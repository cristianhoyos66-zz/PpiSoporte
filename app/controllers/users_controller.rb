class UsersController < ApplicationController
	load_and_authorize_resource	
  def index
  	@user = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	role = params[:user][:role]
  	if @user.update_attributes(user_params)
  			@user.set_role Role.find_by_name(role)
        flash[:notice] = "Se ha modificado correctamente"
        redirect_to @user
    end
	end

  def destroy
  	@user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

 	def user_params
    params.require(:user).permit(:role)
  end

end
