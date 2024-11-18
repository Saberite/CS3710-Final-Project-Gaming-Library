class Gamer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    
    
    #one to one relationship. Each Gamer has a Library
    has_one :library, dependent: :destroy

    #Validations
    validates :first_name, :last_name, :favorite_genere, :username, :password, presence: true  



  
end
