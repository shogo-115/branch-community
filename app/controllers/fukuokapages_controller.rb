class FukuokapagesController < ApplicationController

  def index
    @users = User.where(birth_place: "福岡県").page(params[:page]).per(15)
  end

end
