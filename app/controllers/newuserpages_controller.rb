class NewuserpagesController < ApplicationController

  def index
    @users = User.all.page(params[:page]).per(15)
  end

end
