class GamersController < ApplicationController
  before_action :set_gamer, only: %i[ show edit update destroy ]

  
  # Logged-in student or admin can only modify their own profile
  before_action :correct_gamer, only: %i[ edit update destroy ]

  # GET /gamers or /gamers.json
  def index
    # Testing purposes: show all gamers 
    # @gamers = Gamer.all

    @search_params = params[:search] || {}
    
    # Intialize Gamers to be empty for users, but available for admins
    # The "&" is a safe navigation operator. Basically if the user is not an admin, it sets the method to false meaning that it moves on to the next method. 
    # Because of the three scenerios that my user can be using the app:
    # First case is an Admin signed in, meaning that they can see everyone in Gamers
    # Second case is someone signed in, but a gamer role will only see their profile
    # Third case is an someone not signed in. Setting gamer to nil
    # Infomation is on https://www.visuality.pl/posts/safe-navigation-operator-vs-try-in-rails#:~:text=Safe%20navigation%20operator%20%26.%20is%20provided,if%20called%20method%20is%20defined.
    # Thanks to ChatGPT for also helping understand functionality for safe navigation!
    if current_gamer&.admin?
      @gamers = Gamer.all
    elsif current_gamer
      @gamers = Gamer.where(id: current_gamer.id)
    else
      @gamers = Gamer.none
    end
    
      
    #If search is present, hide all
    if params[:search].present?
      
      #When search is made, show gamer index according to filter
      @gamers = Gamer.all

      # Furthering testing will be needed! Refered to team mates, and should make a change from reading api data to mapping api data to my view(?)
      # Search for games using IGDB Database
      if @search_params[:game_search].present?
        @games = search_games(@search_params[:game_search])

        # Testing to see if I could just call the method directly using the command. Update Note: (Does not work)
        # @games = IGDBService.new.search_games(@search_params[:game_search])

        # Testing to see if any response is made to API in Rails terminal
        Rails.logger.debug("Games data: #{@games.inspect}")

      end

      # Search for Usernames. Used for Admins only
      if @search_params[:username].present?
        @gamers = @gamers.where(username: search_params[:username])
      end
      
    

    end #End of hide all

    # In the case that there is no search, send this message
    # The "&" is a safe navigation operator. This allows for gamer to nil or not signed in this case and this step is skipped  
    if @gamers&.empty?
      @gamers_message = "Please enter search criteria gamer or games" 
    end
    

  end

  # GET /gamers/1 or /gamers/1.json
  def show
  end

  # GET /gamers/new
  def new
    @gamer = Gamer.new
  end

  # GET /gamers/1/edit
  def edit
  end

  # POST /gamers or /gamers.json
  def create
    @gamer = Gamer.new(gamer_params)

    respond_to do |format|
      if @gamer.save
        format.html { redirect_to @gamer, notice: "Gamer was successfully created." }
        format.json { render :show, status: :created, location: @gamer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gamer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gamers/1 or /gamers/1.json
  def update
    respond_to do |format|
      if @gamer.update(gamer_params)
        format.html { redirect_to @gamer, notice: "Gamer was successfully updated." }
        format.json { render :show, status: :ok, location: @gamer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gamer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gamers/1 or /gamers/1.json
  def destroy
    @gamer.destroy!

    respond_to do |format|
      format.html { redirect_to gamers_path, status: :see_other, notice: "Gamer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamer
      @gamer = Gamer.find(params[:id])
    end
    
    # From portfolio_app version 2. Used to ensure the current gamer can't modify other profiles that isn't theirs
    # Admins will also have control to modifly profiles
    def correct_gamer
      unless current_gamer == @gamer || current_gamer.admin?
        redirect_to root_path, alert: "You are not authorized to modify this profile."
      end
    end

    # Used for searching games
    # Using IGDBService.new allows to search for games and will return results for games
    # Tested in rails console, but some issues with displaying in application
    def search_games(query)
      igdb_service = IGDBService.new
      games = igdb_service.search_games(query)

    rescue StandardError => e
      Rails.logger.error("IGDB API error: #{e.message}")
      @gamers_message = "Unable to fetch game data from IGDB at the moment."
      []
    end

    # Only allow a list of trusted parameters through.
    # Include the one to one relationship
    def gamer_params
      params.require(:gamer).permit(:first_name, :last_name, :favorite_genere, :username, library_attributes: [:id, :game_name, :game_desc])
    end
end
