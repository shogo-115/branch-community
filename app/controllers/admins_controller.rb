class AdminsController < ApplicationController

  def index
    @q = Admin.ransack(params[:q])
    @admins = @q.result(distinct: true)
  end

  def search
    @q = Admin.search(search_params)
    @admins = @q.result(distinct: true)
  end

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

  def search_params
    params.require(:q).permit(:name_cont, :category_eq, :birth_place_eq)
  end

  def admin_params
    params.require(:admin).permit(:name, :category, :birth_place, :profile, :image)
  end

end