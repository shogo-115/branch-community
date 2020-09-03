class Message < ApplicationRecord
  
  belongs_to :room

  validates :content, presence: true
  validates :content, length: { maximum: 100 }

end
