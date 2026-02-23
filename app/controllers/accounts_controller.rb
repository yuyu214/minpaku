class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(account_params)
      redirect_to account_path, notice: "アカウント情報を更新しました"
    else
      render :edit
    end
  end

  private

  def account_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
