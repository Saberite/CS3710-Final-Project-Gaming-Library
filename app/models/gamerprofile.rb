class Gamerprofile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    
    #Validations
    validates :first_name, :last_name, :favorite_genere, :username, presence: true 
end
