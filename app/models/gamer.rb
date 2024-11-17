class Gamer < ApplicationRecord
    #one to one relationship. Each Gamer has a Library
    has_one :library
end
