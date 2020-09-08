class SportspagesController < ApplicationController

  def index
    @admins = Admin.where(category: "スポーツ").page(params[:page]).per(15)
  end

end
