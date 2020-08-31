class NewuserpagesController < ApplicationController

  def index
    @users = User.all
  end

end
