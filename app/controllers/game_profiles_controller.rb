class GameProfilesController < ApplicationController
  before_action :set_game_profile, only: %i[ show edit update destroy ]

  # GET /game_profiles or /game_profiles.json
  def index
    @game_profiles = GameProfile.all
  end

  # GET /game_profiles/1 or /game_profiles/1.json
  def show
  end

  # GET /game_profiles/new
  def new
    @game_profile = GameProfile.new
  end

  # GET /game_profiles/1/edit
  def edit
  end

  # POST /game_profiles or /game_profiles.json
  def create
    @game_profile = GameProfile.new(game_profile_params)

    respond_to do |format|
      if @game_profile.save
        format.html { redirect_to @game_profile, notice: "Game profile was successfully created." }
        format.json { render :show, status: :created, location: @game_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_profiles/1 or /game_profiles/1.json
  def update
    respond_to do |format|
      if @game_profile.update(game_profile_params)
        format.html { redirect_to @game_profile, notice: "Game profile was successfully updated." }
        format.json { render :show, status: :ok, location: @game_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_profiles/1 or /game_profiles/1.json
  def destroy
    @game_profile.destroy!

    respond_to do |format|
      format.html { redirect_to game_profiles_path, status: :see_other, notice: "Game profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_profile
      @game_profile = GameProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_profile_params
      params.require(:game_profile).permit(:first_name, :last_name, :favorite_genere, :username, :password, :email)
    end
end
