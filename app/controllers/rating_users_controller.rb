class RatingUsersController < ApplicationController
  before_action :set_rating_user, only: [:show, :edit, :update, :destroy]

  # GET /rating_users
  # GET /rating_users.json
  def index
    @rating_users = RatingUser.all
  end

  # GET /rating_users/1
  # GET /rating_users/1.json
  def show
  end

  # GET /rating_users/new
  def new
    @rating_user = RatingUser.new
  end

  # GET /rating_users/1/edit
  def edit
  end

  # POST /rating_users
  # POST /rating_users.json
  def create
    @rating_user = RatingUser.new(rating_user_params)
    @rating_user.user_id = current_user.id

    respond_to do |format|
      if @rating_user.save
        format.html { redirect_to user_path(@rating_user.rated_user_id), notice: 'La Calificación se envio correctamente.' }
        format.json { render user_path(@rating_user.rated_user_id), status: :created, location: @rating_user }
      else
        format.html { render :new }
        format.json { render json: @rating_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rating_users/1
  # PATCH/PUT /rating_users/1.json
  def update
    respond_to do |format|
      if @rating_user.update(rating_user_params)
        format.html { redirect_to user_path(@rating_user.rated_user_id), notice: 'Rating user was successfully updated.' }
        format.json { render user_path(@rating_user.rated_user_id), status: :ok, location: @rating_user }
      else
        format.html { render :edit }
        format.json { render json: @rating_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_users/1
  # DELETE /rating_users/1.json
  def destroy
    @rating_user.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@rating_user.rated_user_id), notice: 'Calificación eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_user
      @rating_user = RatingUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_user_params
      params.require(:rating_user).permit(:rating, :comment, :rated_user_id)
    end
end
