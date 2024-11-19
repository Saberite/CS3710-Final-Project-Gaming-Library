class GamerprofilesController < ApplicationController
  before_action :set_gamerprofile, only: %i[ show edit update destroy ]

  # GET /gamerprofiles or /gamerprofiles.json
  def index
    @gamerprofiles = Gamerprofile.all
  end

  # GET /gamerprofiles/1 or /gamerprofiles/1.json
  def show
  end

  # GET /gamerprofiles/new
  def new
    @gamerprofile = Gamerprofile.new
  end

  # GET /gamerprofiles/1/edit
  def edit
  end

  # POST /gamerprofiles or /gamerprofiles.json
  def create
    @gamerprofile = Gamerprofile.new(gamerprofile_params)

    respond_to do |format|
      if @gamerprofile.save
        format.html { redirect_to @gamerprofile, notice: "Gamerprofile was successfully created." }
        format.json { render :show, status: :created, location: @gamerprofile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gamerprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gamerprofiles/1 or /gamerprofiles/1.json
  def update
    respond_to do |format|
      if @gamerprofile.update(gamerprofile_params)
        format.html { redirect_to @gamerprofile, notice: "Gamerprofile was successfully updated." }
        format.json { render :show, status: :ok, location: @gamerprofile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gamerprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gamerprofiles/1 or /gamerprofiles/1.json
  def destroy
    @gamerprofile.destroy!

    respond_to do |format|
      format.html { redirect_to gamerprofiles_path, status: :see_other, notice: "Gamerprofile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamerprofile
      @gamerprofile = Gamerprofile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gamerprofile_params
      params.require(:gamerprofile).permit(:first_name, :last_name, :favorite_genere, :username, :password)
    end
end
