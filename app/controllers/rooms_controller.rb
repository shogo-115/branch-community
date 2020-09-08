class RoomsController < ApplicationController
  
  def index
    if user_signed_in?
      @rooms = current_user.rooms.page(params[:page]).per(15)
    elsif admin_signed_in?
      @rooms = current_admin.rooms.page(params[:page]).per(15)
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if user_signed_in?
      if @room.user.id == current_user.id
        @admin= @room.admin
      else
        redirect_to root_path
      end
    elsif admin_signed_in?
      if @room.admin.id == current_admin.id
        @user = @room.user
      else
        redirect_to root_path
      end

    else
      redirect_to root_path
    end
  end

  def create
    if user_signed_in?
      @room = Room.new(room_admin_params)
      @room.user_id = current_user.id
    elsif admin_signed_in?
      @room = Room.new(room_user_params)
      @room.admin_id = current_admin.id
    else
      redirect_to root_path
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to root_path
    end
  end

  private
  def room_admin_params
    params.require(:room).permit(:admin_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
