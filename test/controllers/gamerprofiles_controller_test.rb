require "test_helper"

class GamerprofilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gamerprofile = gamerprofiles(:one)
  end

  test "should get index" do
    get gamerprofiles_url
    assert_response :success
  end

  test "should get new" do
    get new_gamerprofile_url
    assert_response :success
  end

  test "should create gamerprofile" do
    assert_difference("Gamerprofile.count") do
      post gamerprofiles_url, params: { gamerprofile: { favorite_genere: @gamerprofile.favorite_genere, first_name: @gamerprofile.first_name, last_name: @gamerprofile.last_name, password: @gamerprofile.password, username: @gamerprofile.username } }
    end

    assert_redirected_to gamerprofile_url(Gamerprofile.last)
  end

  test "should show gamerprofile" do
    get gamerprofile_url(@gamerprofile)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamerprofile_url(@gamerprofile)
    assert_response :success
  end

  test "should update gamerprofile" do
    patch gamerprofile_url(@gamerprofile), params: { gamerprofile: { favorite_genere: @gamerprofile.favorite_genere, first_name: @gamerprofile.first_name, last_name: @gamerprofile.last_name, password: @gamerprofile.password, username: @gamerprofile.username } }
    assert_redirected_to gamerprofile_url(@gamerprofile)
  end

  test "should destroy gamerprofile" do
    assert_difference("Gamerprofile.count", -1) do
      delete gamerprofile_url(@gamerprofile)
    end

    assert_redirected_to gamerprofiles_url
  end
end
