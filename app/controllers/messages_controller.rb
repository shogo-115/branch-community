class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    if user_signed_in?
      @message.is_user = true
    elsif admin_signed_in?
      @message.is_user = false
    end
    @message.room_id = @room.id
    @message.save
      respond_to do |format|
        format.json
      end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

end
