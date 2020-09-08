class UserfavoritesController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def index
    @userfavorites = Userfavorite.where(admin_id: current_admin.id).page(params[:page]).per(15)
  end

  def create
    @userfavorite = Userfavorite.new(
      admin_id: current_admin.id, 
      user_id: @user.id
    )
    @userfavorite.save
  end

  def destroy
    @userfavorite = Userfavorite.find_by(
      admin_id: current_admin.id, 
      user_id: @user.id
    )
    @userfavorite.destroy
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
