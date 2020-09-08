class SkilluppagesController < ApplicationController

  def index
    @admins = Admin.where(category: "スキルアップ").page(params[:page]).per(15)
  end
  
end
