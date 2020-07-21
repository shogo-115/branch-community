class LovepagesController < ApplicationController

  def index
    @admins = Admin.where(category: "恋愛・婚活")
  end

end
