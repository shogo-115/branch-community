class AdminsController < ApplicationController

  def show
    @admin = Admin.find(params[:id])
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