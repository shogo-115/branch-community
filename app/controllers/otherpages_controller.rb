class OtherpagesController < ApplicationController

  def index
    @users = User.where(birth_place: [1,2,3,4,5,6,7,8,9,10,
    11,15,16,17,18,19,20,21,22,24,25,28,29,30,31,32,33,34,
    35,36,37,38,39,41,42,43,44,45,46,47]).page(params[:page]).per(15)
  end

end
