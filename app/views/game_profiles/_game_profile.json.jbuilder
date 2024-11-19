json.extract! game_profile, :id, :first_name, :last_name, :favorite_genere, :username, :password, :email, :created_at, :updated_at
json.url game_profile_url(game_profile, format: :json)
