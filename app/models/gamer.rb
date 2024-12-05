class Gamer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



    # Roles set up for admin and user
    enum role: { gamer: 0, admin: 1 }

    # When a user is created, they are assigned the role of gamer(user)
    # Information for roles are thanks to https://www.youtube.com/watch?v=DYE6CB7nzcE
    after_initialize :set_default_role, :if => :new_record?
    def set_default_role
        self.role ||= :gamer
    end
    # There is one admin created and set. 
    # Username: admin, Email: admin@email.com, Password: Password
    # Admin Role has access to everyone
    # User has access to only account

    #Each gamer have one library. If the gamer is destroyed, library also gets deleted 
    has_one :library, dependent: :destroy
    #After gamer is made, create a library tied to that gamer
    after_create :create_library

    #allows editing of library info in form
    accepts_nested_attributes_for :library

    


    #Validations for Gamer attributes
    validates :first_name, presence:true
    validates :last_name, presence:true
    # validates :favorite_genere, presence:true
    validates :username, presence:true
    # validates :username, uniquiness:true


    private

    #create_library function
    def create_library
        #link portfolio to id of student
        Library.create!(gamer: self, active: false)
    end
end
