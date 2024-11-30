require 'rails_helper'

RSpec.describe "Gamers", type: :request do
  describe "GET /gamers" do
    context "when gamers exist" do
      let!(:gamer) { Gamer.create!(first_name: "John", last_name: "Jims", favorite_genere: "Horror", username: "JoJo" ) }

      # Test 1: Returns a successful response and displays the search form
      it "returns a successful response and displays the search form" do
        get gamers_path
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('Search') # Ensure search form is rendered
      end

    end
  
    # Rspec Testing for Model validations
    #describe "validations" do
      #let(:gamer) {}

    # Search IGDB functionality
    # Currently API works through Rails console,
    describe "GET /gamers IGDB Search Functionality" do

      it "returns search for The Legend of Zelda from IGDB API for user" do
        get gamers_path, params: { search: {game_search: "The Legend of Zelda"}}
        expect(response.body).to include("Zelda")
        expect(response.body).to_not include("The Legend of Zelda")
      end

    # Post for creation of gamer. Format is from Test #7 in Portfolio_app!
    describe "POST /gamers" do
      context "with valid parameters" do
        it "Creates a new gamer and redirects" do  
          expect {
            post gamers_path, params: {gamer: {first_name: "FirstName", last_name: "LastName", favorite_genere: "Action", username: "Username"  }}
          }.to change(Gamer, :count). by(1)

          expect(response).to have have_http_status(:found) # Should redirect after creating a gamer
          follow_redirect!
          expect(reponse.body).to include("FirstName", "LastName") # Checks to see if page will have first_name and last)name
        end

    # Testing validations for Gamer model
    context "invaild parameter for Gamer" do
      it "Fails to create a student when fields are empty" do
        expect {
          post gamers_path, params: {gamer: {first_name: "", last_name: "", favorite_genere: "", username: ""  }}
      }.to_not change(Gamer, :count)

      # Expect unprocessed reponse
      expect(response).to have http_status(:unprocessed_entity)
      end
    end


    # Testing for Devise Sign Up
    describe "Gamer Registration" do
      # New user with correct information
     context "new user with valid information" do
       it "allows a user to sign up" do
         visit new_gamer_registration_path
         fill_in "First name", with: "Capybara"
         fill_in "Last name", with: "Rspec"
         fill_in "Username", with: "Random"
         fill_in "Email", with: "Random@email.com"
         fill_in "Password", with: "password"
         fill_in "Password confirmation", with: "password"
         click_button "Sign up"
         expect(page).to have_content("Welcome! You have signed up successfully.")
       end
     # New user with incorrect information
     end
  end
end
