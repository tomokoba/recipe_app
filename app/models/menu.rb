class Menu < ApplicationRecord
  attachment :image
  belongs_to :user
end
