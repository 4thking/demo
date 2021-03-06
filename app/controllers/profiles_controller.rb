class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]


  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 28)

    @profiles = @profiles.where(steam: params["steam"]) if params["steam"].present?
    @profiles = @profiles.where("mmr > ?", params["min_mmr"]) if params["min_mmr"].present?
    @profiles = @profiles.where("mmr > ?", params["max_mmr"]) if params["max_mmr"].present?
    @profiles = @profiles.where(time_zone: params["time_zone"]) if params["time_zone"].present?
    @profiles = @profiles.where(language_id: params["language_id"]) if params["language_id"].present?
    @profiles = @profiles.where(hero_id: params["hero_id"]) if params["hero_id"].present?
    @profiles = @profiles.where(carry: params["carry"]) if params["carry"].present?
    @profiles = @profiles.where(mid: params["mid"]) if params["mid"].present?
    @profiles = @profiles.where(support: params["support"]) if params["support"].present?
    @profiles = @profiles.where(offlane: params["offlane"]) if params["offlane"].present?
    @profiles = @profiles.where(jungle: params["jungle"]) if params["jungle"].present?
    @profiles = @profiles.where(positionone: params["positionone"]) if params["positionone"].present?
    @profiles = @profiles.where(positiontwo: params["positiontwo"]) if params["positiontwo"].present?
    @profiles = @profiles.where(positionthree: params["positionthree"]) if params["positionthree"].present?
    @profiles = @profiles.where(positionfour: params["positionfour"]) if params["positionfour"].present?
    @profiles = @profiles.where(positionfive: params["positionfive"]) if params["positionfive"].present?
    @profiles = @profiles.where(compete: params["compete"]) if params["compete"].present?
    @profiles = @profiles.where(casual: params["casual"]) if params["casual"].present?

    @disable_footer = true


  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @disable_footer = true
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id


    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:description, :steam, :mmr, :carry, :mid, :support, :offlane, :jungle, :image, :dotabuff, :compete, :casual, :language_id, :time_zone, :hero_id)
    end

    def check_user
      if current_user != @profile.user
        redirect_to root_url, alert: "Sorry this profile belongs to someone else"
      end
    end    
end
