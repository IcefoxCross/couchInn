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
    @user.premium = true
    @user.save  
    #respond_to do |format|
      #if @user.update(user_params)
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        #format.json { render :show, status: :ok, location: @user }
      #else
        #format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
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