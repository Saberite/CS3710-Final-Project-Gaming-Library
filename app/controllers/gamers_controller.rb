class GamersController < ApplicationController
  before_action :set_gamer, only: %i[ show edit update destroy ]

  # GET /gamers or /gamers.json
  def index
    # Testing purposes: show all gamers 
    #@gamers = Gamer.all

    @search_params = params[:search] || {}
    
    # Intialize Gamers to be empty for users, but available for admins
    # Logic is from _search_form.html.erb
      if current_gamer && current_gamer.admin?
        @gamers = Gamer.all
      elif current_gamer && current_gamer.gamer?
        @gamers = Gamer.none
      elsif current_gamer.nil?
        @gamers = Gamer.none
      end
      
    #If search is present, hide all
    if params[:search].present?
      
      #When search is made, show gamer index according to filter
      @gamers = Gamer.all

     
      # Search for games using IGDB Database
      if @search_params[:game_search].present?
        #@games = IGDBService.new.search_games(@search_params[:game_search])
        @games = search_games_via_igdb(@search_params[:game_search])

        Rails.logger.debug("Games data: #{@games.inspect}")

      end

      
    

    end #End of hide all

    # In the case that there is no search, send this message
    
    if @gamers.empty?
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

    # Used for searching games
    # Using IGDBService.new allows to search for games and will return results for games
    # Tested in rails console, but some issues with displaying in application
    def search_games_via_igdb(query)
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
