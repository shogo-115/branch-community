class BeautypagesController < ApplicationController

  def index
    @admins = Admin.where(category: "ビューティー").page(params[:page]).per(15)
  end

end
