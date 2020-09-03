class AdminsController < ApplicationController

  def show
    if user_signed_in?
      @admin = Admin.find(params[:id])
      rooms = current_user.rooms
      @admin_ids = []
      rooms.each do |r|
        @admin_ids << r.admin_id
      end
    else
      @admin = Admin.find(params[:id])
    end
  end

  def edit
  end

  def update
    if current_admin.update(admin_params)
      redirect_to salontoppage_path
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :category, :birth_place, :profile, :image)
  end

end