# Faker can be used to generate a name for models attributes as seen below



FactoryBot.define do
    factory(:gamer) do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      favorite_genere { "Any" } 
      username { "username" }
      email { Faker::Internet.email }
      password { "password" }
      password_confirmation { "password" }
    end
   end
   