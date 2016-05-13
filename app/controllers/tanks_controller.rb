class TanksController < ApplicationController
  before_action :set_tank, only: [:show, :edit, :update, :destroy]

  # GET /tanks
  # GET /tanks.json
  def index
    @tanks = Tank.all
	@countries = Country.all
    @types = Type.all
  end

  # GET /tanks/1
  # GET /tanks/1.json
  def show
  @country = Country.find(Tank.find(params[:id]).country_id)
  @type = Type.find(Tank.find(params[:id]).type_id)
  @ratings = Rating.where(tank_id: (params[:id]))
  @users = User.all
  if (current_user)
  @emptyChecker = @ratings.find_by user_id: current_user.id #oli mukavampaa tehdä tällei ku if lauseella html
  @rating = Rating.new;
  else
  @emptyChecker = nil
  @rating = nil
  end
  end

  # GET /tanks/new
  def new
    @tank = Tank.new
    @countries = Country.all
	@types = Type.all
  end

  # GET /tanks/1/edit
  def edit
  end

  # POST /tanks
  # POST /tanks.json
  def create
  if(current_user)
    @tank = Tank.new params.require(:tank).permit(:name, :year, :country_id, :type_id)

    respond_to do |format|
      if @tank.save
        format.html { redirect_to @tank, notice: 'Tank was successfully created.' }
        format.json { render :show, status: :created, location: @tank }
      else	  
        @countries = Country.all
		@types = Type.all
		format.html {render 'new'}
		end
	  end
    end
  end

  # PATCH/PUT /tanks/1
  # PATCH/PUT /tanks/1.json
  def update
    respond_to do |format|
	if (current_user)
      if @tank.update(tank_params)
        format.html { redirect_to @tank, notice: 'Tank was successfully updated.' }
        format.json { render :show, status: :ok, location: @tank }
      else
        format.html { render :edit }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /tanks/1
  # DELETE /tanks/1.json
  def destroy
  if (current_user)
    @tank.destroy
    respond_to do |format|
      format.html { redirect_to tanks_url, notice: 'Tank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tank
      @tank = Tank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tank_params
      params.require(:tank).permit(:name, :year, :country_id, :type_id)
    end
end
