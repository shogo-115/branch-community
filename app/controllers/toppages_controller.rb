class ToppagesController < ApplicationController
  def index
    @admins = Admin.all
  end
end
