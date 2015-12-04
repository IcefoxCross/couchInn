class RatingCouchesController < ApplicationController
  before_action :set_rating_couch, only: [:show, :edit, :update, :destroy]

  # GET /rating_couches
  # GET /rating_couches.json
  def index
    @rating_couches = RatingCouch.all
  end

  # GET /rating_couches/1
  # GET /rating_couches/1.json
  def show
  end

  # GET /rating_couches/new
  def new
    @rating_couch = RatingCouch.new
  end

  # GET /rating_couches/1/edit
  def edit
  end

  # POST /rating_couches
  # POST /rating_couches.json
  def create
    @rating_couch = RatingCouch.new(rating_couch_params)
    @rating_couch.user_id = current_user.id

    respond_to do |format|
      if @rating_couch.save
        format.html { redirect_to couch_path(@rating_couch.couch), notice: 'La Calificación se envio correctamente.' }
        format.json { render couch_path(@rating_couch.couch), status: :created, location: @rating_couch }
      else
        format.html { render :new }
        format.json { render json: @rating_couch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rating_couches/1
  # PATCH/PUT /rating_couches/1.json
  def update
    respond_to do |format|
      if @rating_couch.update(rating_couch_params)
        format.html { redirect_to couch_path(@rating_couch.couch), notice: 'Rating couch was successfully updated.' }
        format.json { render couch_path(@rating_couch.couch), status: :ok, location: @rating_couch }
      else
        format.html { render :edit }
        format.json { render json: @rating_couch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_couches/1
  # DELETE /rating_couches/1.json
  def destroy
    @rating_couch.destroy
    respond_to do |format|
      format.html { redirect_to couch_path(@rating_couch.couch), notice: 'Calificación eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_couch
      @rating_couch = RatingCouch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_couch_params
      params.require(:rating_couch).permit(:rating, :comment, :couch_id)
    end
end
