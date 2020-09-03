class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    rooms = current_admin.rooms
    @user_ids = []
    rooms.each do |r|
      @user_ids << r.user_id
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :birth_place, :birth_date, :profile, :image)
  end

end
