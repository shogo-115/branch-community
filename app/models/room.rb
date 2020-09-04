class Room < ApplicationRecord
  
  has_many :messages
  belongs_to :user
  belongs_to :admin

  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        'まだメッセージはありません。'
      end
    end
  end
end
