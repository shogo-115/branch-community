class Userfavorite < ApplicationRecord
  belongs_to :admin
  belongs_to :user
end
