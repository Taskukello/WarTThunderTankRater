class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
	@tanks = Tank.all
    @users = User.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    @tank = Tank.find_by id: @rating.tank_id
	@user = User.find_by id: @rating.user_id
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
	@tanks = Tank.all
  end

  # GET /ratings/1/edit
  def edit
    @tanks = Tank.all
  end

  # POST /ratings
  # POST /ratings.json
  def create
   if (current_user)
    @rating = Rating.new params.require(:rating).permit(:rating, :user_id, :tank_id)
    respond_to do |format|
      if @rating.save
        format.html { redirect_to :back, notice: 'Rating was successfully created.' }
        format.json { render :back, status: :created, location: @rating }
      else
	    @tanks = Tank.all
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end
end
  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
  if (current_user.id = @rating.user_id)
    @rating.destroy
		respond_to do |format|
			format.html { redirect_to :back, notice: 'Rating was successfully destroyed.' }
			format.json { head :no_content }
		end
	end
  end
 
  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
   if (current_user.id = @rating.user_id)
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:tank_id, :user_id, :rating)
    end
end
