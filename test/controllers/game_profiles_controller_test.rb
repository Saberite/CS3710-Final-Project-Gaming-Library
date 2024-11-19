require "test_helper"

class GameProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_profile = game_profiles(:one)
  end

  test "should get index" do
    get game_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_game_profile_url
    assert_response :success
  end

  test "should create game_profile" do
    assert_difference("GameProfile.count") do
      post game_profiles_url, params: { game_profile: { email: @game_profile.email, favorite_genere: @game_profile.favorite_genere, first_name: @game_profile.first_name, last_name: @game_profile.last_name, password: @game_profile.password, username: @game_profile.username } }
    end

    assert_redirected_to game_profile_url(GameProfile.last)
  end

  test "should show game_profile" do
    get game_profile_url(@game_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_profile_url(@game_profile)
    assert_response :success
  end

  test "should update game_profile" do
    patch game_profile_url(@game_profile), params: { game_profile: { email: @game_profile.email, favorite_genere: @game_profile.favorite_genere, first_name: @game_profile.first_name, last_name: @game_profile.last_name, password: @game_profile.password, username: @game_profile.username } }
    assert_redirected_to game_profile_url(@game_profile)
  end

  test "should destroy game_profile" do
    assert_difference("GameProfile.count", -1) do
      delete game_profile_url(@game_profile)
    end

    assert_redirected_to game_profiles_url
  end
end
