class GamersController < ApplicationController
  before_action :set_gamer, only: %i[ show edit update destroy ]

  # GET /gamers or /gamers.json
  def index
    #@gamers = Gamer.all

    @search_params = params[:search] || {}
    
    #Intialize Students to be empty before search
    @gamers = Gamer.none

    #If search is present, hide all
    if params[:search].present?
      
      #When search is made, show student index according to filter
      @gamers = Gamer.all


      #Major Search, tied to _search_form.html
      if @search_params[:username].present?
        @gamers = @gamers.where(major: @search_params[:username])
      end

      
    

    end #End of hide all

    # In the case that there is no search, send this message
    
    if @gamers.empty?
      @gamers_message = "Please enter search criteria to find students" 
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

    # Only allow a list of trusted parameters through.
    # Include the one to one relationship
    def gamer_params
      params.require(:gamer).permit(:first_name, :last_name, :favorite_genere, :username, library_attributes: [:id, :game_name, :game_desc])
    end
end
