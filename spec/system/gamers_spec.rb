require 'rails_helper'

# This testing file is used to test User Registeration
# 

#RSpec.describe "Gamers", type: :system do
 # before do
  #  driven_by(:rack_test)
  #end

  #pending "add some scenarios (or delete) #{__FILE__}"
#end

RSpec.feature "User Registration", type: :feature do

   # Testing for Devise Sign Up. 
   describe "Gamer Registration" do
    # New user with correct information
    context "new user with valid information" do
      it "allows a user to sign up" do

        # Testing 
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
    end
end

# Sign in sucessful
feature "User signs in", type: :feature do
  # Factory Bot set up for gamer
  gamer = FactoryBot.create(:gamer)
  scenario "with correct credentials" do
  
  # Goes to sign in path
  visit new_gamer_session_path

  # Fills fields with factory bot's gamer info
  fill_in "Email", with: gamer.email
  fill_in "Password", with: gamer.password

  # Attempts to sign in
  click_button "Log in"

  expect(page).to have_current_path(gamer_path(gamer))
  expect(page).to have_content("Home")
  end


  # Invaild sign in system test
  scenario "With invalid credentials" do
  visit new_gamer_session_path

  # Fields are blank
  fill_in "Email", with: ""
  fill_in "Password", with: ""

  # Attempts to log in
  click_button "Log in"
 
  expect(page).to have_current_path(gamer_session_path)
  expect(page).to have_content("Invalid Email or password") # Fails to log in
  end
 end
  
end

# Gamer sign in and sign out
feature "User signs in and signs out", type: :feature do
  scenario "Sign in, then sign out gamer" do
    gamer = FactoryBot.create(:gamer)
    visit new_gamer_session_path

    # Signs in
    fill_in "Email", with: gamer.email
    fill_in "Password", with: gamer.password
    
    click_button "Log in"

    # Signs out
    click_button "Sign Out"

    expect(page).to have_current_path(gamers_path) # Routes back to index
    expect(page).to have_content("Signed out successfully") # Message at top
    
  end
end