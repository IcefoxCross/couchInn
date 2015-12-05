class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy, :premium]
    before_action :authenticate_user!
    before_action :is_premium, only: [:premium]

    def is_premium
        @prem=true
        if (current_user==nil)
            redirect_to couches_path, alert: "Error: Tiene que estar registrado para ser premium"
            @prem=false
        else        
            if (current_user.premium==true)
                redirect_to couches_path, alert: "Error: Usted ya es premium"
                @prem=false
            end
        end
    end
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # calificaciones del @user
    @ratings = RatingUser.where(rated_user_id: @user.id)
    # si el current_user puede calificar @puede_calificar es mayor a 0
    # crear condicion Reservation.joins() o Reservation.where()
    if user_signed_in?
      @puede_calificar = Reservation.joins(:couch).where('couches.user'=> current_user, user: @user).where("end_date < :d",{d: Date.current}).count
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  # PATCH/PUT /users/2
  # PATCH/PUT /users/2.json
  def premium
    @user=User.find(params[:id])
#    respond_to do |format|
#      if User.find(params[:id])
#          format.html { redirect_to @user, notice: 'Se ha convertido en premium' }
#        format.json { render :show, status: :created, location: @user }
#      else
#        format.html { render :premium }
#        format.json { render json: @user.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
          format.html { redirect_to @user, notice: 'Usuarop creado exitosamente' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
          format.html { redirect_to @user, notice: 'Usuario actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @user }
      else
          format.html { render :premium }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
        format.html { redirect_to users_url, notice: 'Usuario eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:name, :id, :lastName, :email, :password, :admin, :premium, :card_number, :card_security_number, :card_titular)
    end
end