require "application_system_test_case"

class GamerprofilesTest < ApplicationSystemTestCase
  setup do
    @gamerprofile = gamerprofiles(:one)
  end

  test "visiting the index" do
    visit gamerprofiles_url
    assert_selector "h1", text: "Gamerprofiles"
  end

  test "should create gamerprofile" do
    visit gamerprofiles_url
    click_on "New gamerprofile"

    fill_in "Favorite genere", with: @gamerprofile.favorite_genere
    fill_in "First name", with: @gamerprofile.first_name
    fill_in "Last name", with: @gamerprofile.last_name
    fill_in "Password", with: @gamerprofile.password
    fill_in "Username", with: @gamerprofile.username
    click_on "Create Gamerprofile"

    assert_text "Gamerprofile was successfully created"
    click_on "Back"
  end

  test "should update Gamerprofile" do
    visit gamerprofile_url(@gamerprofile)
    click_on "Edit this gamerprofile", match: :first

    fill_in "Favorite genere", with: @gamerprofile.favorite_genere
    fill_in "First name", with: @gamerprofile.first_name
    fill_in "Last name", with: @gamerprofile.last_name
    fill_in "Password", with: @gamerprofile.password
    fill_in "Username", with: @gamerprofile.username
    click_on "Update Gamerprofile"

    assert_text "Gamerprofile was successfully updated"
    click_on "Back"
  end

  test "should destroy Gamerprofile" do
    visit gamerprofile_url(@gamerprofile)
    click_on "Destroy this gamerprofile", match: :first

    assert_text "Gamerprofile was successfully destroyed"
  end
end
