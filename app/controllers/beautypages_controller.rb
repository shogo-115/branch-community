class BeautypagesController < ApplicationController

  def index
    @admins = Admin.where(category: "ビューティー")
  end

end
