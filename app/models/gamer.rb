class Gamer < ApplicationRecord


    #Validations for Gamer attributes
    validates :first_name, presence:true
    validates :last_name, presence:true
    validates :favorite_genere, presence:true
    validates :username, presence:true
    validates :username, uniquiness:true
end
