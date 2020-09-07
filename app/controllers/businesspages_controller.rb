class BusinesspagesController < ApplicationController

  def index
    @admins = Admin.where(category: "ビジネス").page(params[:page]).per(15)
  end

end
