require 'rails_helper'

RSpec.describe "Gamers", type: :request do
  describe "GET /gamers" do
    context "when gamers exist" do
      let!(:gamer) { Gamer.create!(first_name: "John", last_name: "Jims", favorite_genere: "Horror", username: "JoJo", email: "JJ@email.com", password: "password" ) }

      # Test 1: Returns a successful response and displays the search form
      it "returns a successful response and displays the search form" do
        get gamers_path
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('Search') # Ensure search form is rendered
      end

    end
  end
  
  
    

    # Search IGDB functionality
    # Currently API works through Rails console,
    describe "GET /gamers IGDB Search Functionality" do

      it "returns search for The Legend of Zelda from IGDB API for user" do
        get gamers_path, params: { search: {game_search: "The Legend of Zelda"}}
        expect(response.body).to include("Zelda")
        expect(response.body).to_not include("The Legend of Zelda")
      end

    end

    # Model Validations in Rspec
    # Post for creation of gamer. Format is from Test #7 in Portfolio_app!
  describe "POST /gamers" do
      context "with valid parameters" do
        it "Creates a new gamer and redirects" do  
          expect {
            post gamers_path, params: {gamer: {first_name: "FirstName", last_name: "LastName", favorite_genere: "Action", username: "Username", email: "Test@email.com", password: 'password'  }}
          }.to change(Gamer, :count). by(1)

          expect(response).to have_http_status(:see_other) # Status code 303 and should redirect after creating a gamer
          follow_redirect!
          expect(response.body).to include("FirstName", "LastName") # Checks to see if page will have first_name and last_name
        end
      end
    
      context "with invalid parameters minus favorite_genere" do
        it "Creates a new gamer and redirects" do  
          expect {
            post gamers_path, params: {gamer: {first_name: "FirstName2", last_name: "LastName2", favorite_genere: "", username: "Username2", email: "Test2@email.com", password: 'password'  }}
          }.to change(Gamer, :count). by(1)

          expect(response).to have_http_status(303)
          
        end
      end

    # Testing validations for Gamer model
    context "invaild parameter for Gamer" do
      it "Fails to create a student when fields are empty" do
        expect {
          post gamers_path, params: {gamer: {first_name: "", last_name: "", favorite_genere: "", username: "", email: "", password: ""  }}
      }.to_not change(Gamer, :count)

      # Expect unprocessed reponse
      expect(response).to have_http_status(422)
      #expect(response).to have_http_status(:see_other) # Status code 303


      end
    end

    # Testing some fields filled
    context "valid parameters for Gamer besides first_name" do
      it "Fails to create a student when first_name field is empty" do
        expect {
          post gamers_path, params: {gamer: {first_name: "", last_name: "LastTest", favorite_genere: "Action", username: "username3", email: "e@email.com", password: "password"  }}
      }.to_not change(Gamer, :count)

      # Expect unprocessed reponse
      expect(response).to have_http_status(422)
     


      end
    end

  end


end
