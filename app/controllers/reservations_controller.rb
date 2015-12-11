class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  def index_self
    @reservations = Reservation.where(user: current_user).paginate(:page => params[:page], :per_page => 10)
  end
    
  def index_receibed
#      @couches=Couch.where(user: current_user)
#      @couches.each do |couch|
#          @reservations = Reservation.where(couch_id: couch.id).paginate(:page => params[:page], :per_page => 10)
##          @reserv.each do |reserv|
##              
##          end
#      end
#          
#          @reserv.each do |reserv|
#              @reserv.
#              @res << 
#          end
#         end
      @reservations = Reservation.all
      
  end  
    def index_couch
#      @couches=Couch.where(user: current_user)
#      @couches.each do |couch|
#          @reservations = Reservation.where(couch_id: couch.id).paginate(:page => params[:page], :per_page => 10)
##          @reserv.each do |reserv|
##              
##          end
#      end
#          
#          @reserv.each do |reserv|
#              @reserv.
#              @res << 
#          end
#         end
#        @c=Couch.find(@couch.id)
#        @reservations = Reservation.where(couch_id: @c.id)
        @reservations = Reservation.where(couch_id: params[:couch_id])
      
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new(couch_id: params[:couch_id])
    #@couch = Couch.find(@reservation.couch)
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.confirmed = false

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservations_self_path, notice: 'La reserva fue enviada exitosamente.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'La reserva fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_self_path, notice: 'La reserva fue eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end
  def accept
      @reservation=Reservation.find(params[:reservation_id])
      @reservation.confirmed=true
      @reservation.save
      @reservations=Reservation.all
      @reservations.each do |r|
          if (r.id!=@reservation.id)
              if(((r.end_date<=@reservation.end_date)&&(r.end_date>=@reservation.start_date))||((r.start_date>=@reservation.start_date)&&(r.start_date<=@reservation.end_date)))
                  r.destroy
              end
          end
      end
      redirect_to reservations_receibed_path, notice: 'La reserva fue actualizada exitosamente.' 
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
        @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date, :confirmed, :couch_id)
    end
end
