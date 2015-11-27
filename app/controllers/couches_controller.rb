class CouchesController < ApplicationController
  before_action :set_couch, only: [:show, :edit, :update, :destroy]

  # GET /couches
  # GET /couches.json
  def index
      @couches = Couch.paginate(:page => params[:page], :per_page => 3)
  end

    def index_self
        @couches = Couch.where(user: current_user).paginate(:page => params[:page], :per_page => 10)
    end

  # GET /couches/1
  # GET /couches/1.json
  def show
    @url_back = request.referrer
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
