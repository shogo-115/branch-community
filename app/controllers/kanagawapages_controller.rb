class KanagawapagesController < ApplicationController

  def index
    @users = User.where(birth_place: "神奈川県")
  end

end
