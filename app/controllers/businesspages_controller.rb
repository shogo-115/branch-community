class BusinesspagesController < ApplicationController

  def index
    @admins = Admin.where(category: "ビジネス")
  end

end
