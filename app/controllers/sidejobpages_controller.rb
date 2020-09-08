class SidejobpagesController < ApplicationController

  def index
    @admins = Admin.where(category: "副業").page(params[:page]).per(15)
  end

end
