class FoodpagesController < ApplicationController

  def index
    @admins = Admin.where(category: "フード・グルメ").page(params[:page]).per(15)
  end

end
