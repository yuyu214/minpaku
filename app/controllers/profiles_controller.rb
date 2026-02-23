class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    # ✅ アイコン削除チェックが入っていたら削除
    if params[:user][:remove_avatar] == "1"
      current_user.avatar.purge if current_user.avatar.attached?
    end

    if current_user.update(profile_params)
      redirect_to profile_path, notice: "保存しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(
      :name,
      :introduction,
      :avatar
    )
  end
end
