class TokyopagesController < ApplicationController

  def index
    @users = User.where(birth_place: "東京都")
  end

end
