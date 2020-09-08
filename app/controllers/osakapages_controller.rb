class OsakapagesController < ApplicationController

  def index
    @users = User.where(birth_place: "大阪府").page(params[:page]).per(15)
  end

end
