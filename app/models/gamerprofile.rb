class Gamerprofile < ApplicationRecord
    
    
    #Validations
    validates :first_name, :last_name, :favorite_genere, :username, :password, presence: true 
end
