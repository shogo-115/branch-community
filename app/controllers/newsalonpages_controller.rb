class NewsalonpagesController < ApplicationController

  def index
    @admins = Admin.all
  end

end
