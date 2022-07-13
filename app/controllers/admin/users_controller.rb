class Admin::UsersController < ApplicationController

  def index
    @user= current_user
    @users= User.all
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "利用者情報変更しました"
      redirect_to admin_user_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :fast_name, :last_name_kana, :fast_name_kana, :postal_code, :address, :phone_number)
  end
end
