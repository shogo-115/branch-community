class AichipagesController < ApplicationController

  def index
    @users = User.where(birth_place: "愛知県").page(params[:page]).per(15)
  end

end
