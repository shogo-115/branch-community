class ChibapagesController < ApplicationController

  def index
    @users = User.where(birth_place: "千葉県").page(params[:page]).per(15)
  end

end
