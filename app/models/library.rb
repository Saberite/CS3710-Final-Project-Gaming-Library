class Library < ApplicationRecord
  belongs_to :gamer

  #validates :game_name, presence:true
  #validates :game_name, uniquiness:true
end
