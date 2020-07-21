class FoodpagesController < ApplicationController

  def index
    @admins = Admin.where(category: "フード・グルメ")
  end

end
