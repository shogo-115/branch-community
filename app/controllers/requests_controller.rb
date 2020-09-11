class RequestsController < ApplicationController
  before_action :set_admin, only: [:create, :destroy, :show, :new_done, :destroy_done]

  def index
    if user_signed_in?
      @requests = Request.where(user_id: current_user.id).page(params[:page]).per(15)
    elsif admin_signed_in?
      @requests = Request.where(admin_id: current_admin.id).page(params[:page]).per(15)
    end
  end

  def create
    @request = Request.new(
      user_id: current_user.id, 
      admin_id: @admin.id
    )
    @request.save
    redirect_to action: 'new_done'
  end

  def destroy
    @request = Request.find_by(
      user_id: current_user.id, 
      admin_id: @admin.id
    )
    @request.destroy
    redirect_to action: 'destroy_done'
  end

  def show
  end

  def new_done
  end

  def destroy_done
  end

  private
  def set_admin
    @admin = Admin.find(params[:admin_id])
  end
end
