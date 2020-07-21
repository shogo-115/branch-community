class SalontoppagesController < ApplicationController
  def index
    @users = User.all
  end
end
