class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    respond_to do |format| 
      format.json {render json: @user}
      format.html
    end 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :state, :city, :email, :password, :password_confirmation, :profile_pic, :municipality, :age)
  end
end

