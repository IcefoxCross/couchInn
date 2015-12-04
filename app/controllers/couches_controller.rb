class CouchesController < ApplicationController
  before_action :set_couch, only: [:show, :edit, :update, :destroy]

  # GET /couches
  # GET /couches.json
  def index
      #@couches = Couch.paginate(:page => params[:page], :per_page => 3)

      @filterrific = initialize_filterrific(
        Couch,
        params[:filterrific],
        select_options: {
          sorted_by: Couch.options_for_sorted_by,
          with_type_id: Type.options_for_select
        },
      ) or return
      @couches = @filterrific.find.page(params[:page]).paginate(:page => params[:page], :per_page => 5)

      respond_to do |format|
        format.html
        format.js
      end
  end

    def index_self
        @couches = Couch.where(user: current_user).paginate(:page => params[:page], :per_page => 10)
    end

  # GET /couches/1
  # GET /couches/1.json
  def show
    @url_back = request.referrer
    # si el current_user puede calificar @puede_calificar es mayor a 0
    @puede_calificar = Reservation.where("couch_id = :c AND user_id = :u AND confirmed = :t AND end_date < :d",{c: @couch.id, u: current_user.id, t: true, d: Date.current}).count
  end

  # GET /couches/new
  def new
    @couch = Couch.new
  end

  # GET /couches/1/edit
  def edit
  end

  # POST /couches
  # POST /couches.json
  def create
    @couch = Couch.new(couch_params)
    @couch.user_id = current_user.id

    respond_to do |format|
      if @couch.save
        format.html { redirect_to @couch, notice: 'El Couch fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @couch }
      else
        format.html { render :new }
        format.json { render json: @couch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /couches/1
  # PATCH/PUT /couches/1.json
  def update
    respond_to do |format|
      if @couch.update(couch_params)
        format.html { redirect_to @couch, notice: 'El Couch fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @couch }
      else
        format.html { render :edit }
        format.json { render json: @couch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /couches/1
  # DELETE /couches/1.json
  def destroy
    @couch.destroy
    respond_to do |format|
      format.html { redirect_to couches_self_path, notice: 'El Couch fue eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_couch
      @couch = Couch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def couch_params
      params.require(:couch).permit(:name, :type_id, :description, :location, :dateBegin, :dateEnd, :maxHosts, :image)
    end

end
