#Factory bot will need to be reviewed fro after devise is installed.
#Email, favorite_genere, 

FactoryBot.define do
    factory(:gamer) do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      #favorite_genere { Student::VALID_MAJORS.sample } 
      username { Faker::Name.username }
      #email { "student1@msudenver.edu" }
      #password { "password" }
      #password_confirmation { "password" }
    end
   end
   