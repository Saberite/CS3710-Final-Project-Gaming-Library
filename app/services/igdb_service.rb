# File needed to connect to IGDB api
# ChatGPT was used to help with file structure along with the documents listed below
# Token/Client Id/Client secret are mine!
# Document: https://api-docs.igdb.com/#getting-started

# Intially tried the gem wrapper ruby-apicalypse, but documentation is poor and not updated(?)

require 'http'
# require 'ostruct'

class IGDBService
  API_URL = 'https://api.igdb.com/v4'

  def initialize
    @client_id = 'g75eiml370xtj2f8fjywyruvbmnfpg'
    @client_secret = '96jojse51uncov6s468rsh4tvc1a1t'
    @token = fetch_access_token
  end

  def fetch_access_token
    response = HTTP.post('https://id.twitch.tv/oauth2/token', params: {
      client_id: @client_id,
      client_secret: @client_secret,
      grant_type: 'client_credentials'
    })
    JSON.parse(response.body)['access_token']
  end

  def search_games(query)
    response = HTTP.headers({
      'Client-ID': @client_id,
      'Authorization': "Bearer #{@token}"
    }).post("#{API_URL}/games", body: "search \"#{query}\"; fields name, summary, genres, platforms;")
    # OpenStruct.new(hash)

    # If IGDB API fails to work, rise a response in log
    if response.status.success?
        JSON.parse(response.body)
      else
        raise "API request failed: #{response.status}"
    end
  end
end