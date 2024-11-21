class Gamer < ApplicationRecord


    #Each gamer have one library. If the gamer is destroyed, library also gets deleted 
    has_one :library, dependent: :destroy
    #After gamer is made, create a library tied to that gamer
    after_create :create_library

    #allows editing of library info in form
    accepts_nested_attributes_for :library

    


    #Validations for Gamer attributes
    validates :first_name, presence:true
    validates :last_name, presence:true
    validates :favorite_genere, presence:true
    validates :username, presence:true
    #validates :username, uniquiness:true


    private

    #create_library function
    def create_library
        #link portfolio to id of student
        Library.create!(gamer: self, active: false)
    end
end
