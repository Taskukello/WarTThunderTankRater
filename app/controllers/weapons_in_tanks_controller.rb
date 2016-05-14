class WeaponsInTanksController < ApplicationController
  before_action :set_weapons_in_tank, only: [:show, :edit, :update, :destroy]

  # GET /weapons_in_tanks
  # GET /weapons_in_tanks.json
  def index
    @weapons_in_tanks = WeaponsInTank.all
  end

  # GET /weapons_in_tanks/1
  # GET /weapons_in_tanks/1.json
  def show
  end

  # GET /weapons_in_tanks/new
  def new
    @weapons_in_tank = WeaponsInTank.new
  end

  # GET /weapons_in_tanks/1/edit
  def edit
  end

  # POST /weapons_in_tanks
  # POST /weapons_in_tanks.json
  def create
    if (current_user)
    @weapons_in_tank = WeaponsInTank.new(weapons_in_tank_params)

    respond_to do |format|
      if @weapons_in_tank.save
        format.html { redirect_to :back, notice: 'Weapons in tank was successfully created.' }
        format.json { render :show, status: :created, location: :back }
      else
        format.html { render :new }
        format.json { render json: :back.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /weapons_in_tanks/1
  # PATCH/PUT /weapons_in_tanks/1.json
  def update
    #kuolema sille koittaa ken tätä metodia yrittää kutsua tai ainakin sivun crashi. 
  end

  # DELETE /weapons_in_tanks/1
  # DELETE /weapons_in_tanks/1.json
  def destroy
  if (current_user)
    @weapons_in_tank.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'weapon/tank joint was successfully destroyed.' }
      format.json { head :no_content }
    end
	end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weapons_in_tank
      @weapons_in_tank = WeaponsInTank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weapons_in_tank_params
      params.require(:weapons_in_tank).permit(:tank_id, :weapon_id)
    end
end
