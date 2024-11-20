require "application_system_test_case"

class GamersTest < ApplicationSystemTestCase
  setup do
    @gamer = gamers(:one)
  end

  test "visiting the index" do
    visit gamers_url
    assert_selector "h1", text: "Gamers"
  end

  test "should create gamer" do
    visit gamers_url
    click_on "New gamer"

    fill_in "Favorite genere", with: @gamer.favorite_genere
    fill_in "First name", with: @gamer.first_name
    fill_in "Last name", with: @gamer.last_name
    fill_in "Username", with: @gamer.username
    click_on "Create Gamer"

    assert_text "Gamer was successfully created"
    click_on "Back"
  end

  test "should update Gamer" do
    visit gamer_url(@gamer)
    click_on "Edit this gamer", match: :first

    fill_in "Favorite genere", with: @gamer.favorite_genere
    fill_in "First name", with: @gamer.first_name
    fill_in "Last name", with: @gamer.last_name
    fill_in "Username", with: @gamer.username
    click_on "Update Gamer"

    assert_text "Gamer was successfully updated"
    click_on "Back"
  end

  test "should destroy Gamer" do
    visit gamer_url(@gamer)
    click_on "Destroy this gamer", match: :first

    assert_text "Gamer was successfully destroyed"
  end
end
