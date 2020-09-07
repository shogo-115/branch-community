class NewsalonpagesController < ApplicationController

  def index
    @admins = Admin.all.page(params[:page]).per(15)
  end

end
