class KyotopagesController < ApplicationController

  def index
    @users = User.where(birth_place: "京都府").page(params[:page]).per(15)
  end

end
