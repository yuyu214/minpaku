class UsersController < ApplicationController
  def new
    @user = User.new
  end
end


def edit_profile
end

def update_profile
  if @user.update(profile_params)
    redirect_to user_path(@user)
  else
    render :edit_profile
  end
end

private

def profile_params
  params.require(:user).permit(:name, :introduction, :icon)
end
