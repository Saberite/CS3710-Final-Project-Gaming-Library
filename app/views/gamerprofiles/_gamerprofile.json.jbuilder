json.extract! gamerprofile, :id, :first_name, :last_name, :favorite_genere, :username, :password, :created_at, :updated_at
json.url gamerprofile_url(gamerprofile, format: :json)
