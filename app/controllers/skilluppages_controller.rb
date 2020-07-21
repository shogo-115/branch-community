class SkilluppagesController < ApplicationController

  def index
    @admins = Admin.where(category: "スキルアップ")
  end
  
end
