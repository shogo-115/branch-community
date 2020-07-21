class OsakapagesController < ApplicationController

  def index
    @users = User.where(birth_place: "大阪府")
  end

end
