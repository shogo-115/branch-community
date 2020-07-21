class SportspagesController < ApplicationController

  def index
    @admins = Admin.where(category: "スポーツ")
  end

end
