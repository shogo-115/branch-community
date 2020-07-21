class SidejobpagesController < ApplicationController

  def index
    @admins = Admin.where(category: "副業")
  end

end
