class Public::UsersController < ApplicationController

  def show
    @user= current_user
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "You have updated user successfully."
    else
      render "users/edit"
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :last_name, :fast_name, :last_name_kana, :fast_name_kana, :phone_number,:postal_code, :address)
  end
end