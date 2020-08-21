class SalonfavoritesController < ApplicationController
  before_action :set_admin, only: [:create, :destroy]

  def index
    @salonfavorites = Salonfavorite.where(user_id: current_user.id)
  end

  def create
    @salonfavorite = Salonfavorite.new(
      user_id: current_user.id, 
      admin_id: @admin.id
    )
    @salonfavorite.save
  end

  def destroy
    @salonfavorite = Salonfavorite.find_by(
      user_id: current_user.id,
      admin_id: @admin.id 
    )
    @salonfavorite.destroy
  end

  private
  def set_admin
    @admin = Admin.find(params[:admin_id])
  end
end
