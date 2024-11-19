require "application_system_test_case"

class GameProfilesTest < ApplicationSystemTestCase
  setup do
    @game_profile = game_profiles(:one)
  end

  test "visiting the index" do
    visit game_profiles_url
    assert_selector "h1", text: "Game profiles"
  end

  test "should create game profile" do
    visit game_profiles_url
    click_on "New game profile"

    fill_in "Email", with: @game_profile.email
    fill_in "Favorite genere", with: @game_profile.favorite_genere
    fill_in "First name", with: @game_profile.first_name
    fill_in "Last name", with: @game_profile.last_name
    fill_in "Password", with: @game_profile.password
    fill_in "Username", with: @game_profile.username
    click_on "Create Game profile"

    assert_text "Game profile was successfully created"
    click_on "Back"
  end

  test "should update Game profile" do
    visit game_profile_url(@game_profile)
    click_on "Edit this game profile", match: :first

    fill_in "Email", with: @game_profile.email
    fill_in "Favorite genere", with: @game_profile.favorite_genere
    fill_in "First name", with: @game_profile.first_name
    fill_in "Last name", with: @game_profile.last_name
    fill_in "Password", with: @game_profile.password
    fill_in "Username", with: @game_profile.username
    click_on "Update Game profile"

    assert_text "Game profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Game profile" do
    visit game_profile_url(@game_profile)
    click_on "Destroy this game profile", match: :first

    assert_text "Game profile was successfully destroyed"
  end
end
