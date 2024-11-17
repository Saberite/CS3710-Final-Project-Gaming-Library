class Gamerprofile < ApplicationRecord
    #One to one relationship. Library belongs to Gamer
    belongs_to:gamer
end
