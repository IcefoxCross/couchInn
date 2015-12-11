class PremsController < ApplicationController
    before_action :is_admin, only: [:index, :show, :edit, :delete]
    before_action :is_prem, only: [:new, :create]
    def is_admin
        if (current_user==nil)
            redirect_to couches_path, alert: "Error: Solo los administradores pueden visualizar esta seccion"
        else        
            if (current_user.admin!=true)
                redirect_to couches_path, alert: "Error: Solo los administradores pueden visualizar esta seccion"
            end
        end
    end
    def is_prem
        @pre=true
        if (current_user==nil)
            redirect_to couches_path, alert: "Error: Tiene que estar registrado para ser premium"
            @pre=false
        else        
            if (current_user.premium!=false)
                redirect_to couches_path, notice: "Usted ya es premium"
                @pre=false
            end
        end
    end   

  def index
     @filterrific = initialize_filterrific(
         Prem,
        params[:filterrific],
      ) or return
      @prems = @filterrific.find.page(params[:page]).paginate(:page => params[:page], :per_page => 10)

      respond_to do |format|
        format.html
        format.js
      end
  end
  def create
      @prem = Prem.new(prem_params)
      @prem.user_id = current_user.id
      @prem.monto=50
    respond_to do |format|
        if @prem.save
            format.html { redirect_to couches_path, notice: 'Cambio a premium exitoso' }
        format.json { render :show, status: :created, location: @prem }
            @user=User.find(@prem.user_id)
            @user.premium=true
            @user.save
      else
        format.html { render :new }
        format.json { render json: @prem.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

   def show
     @filterrific = initialize_filterrific(
         Prem,
        params[:filterrific],
      ) or return
      @prems = @filterrific.find.page(params[:page]).paginate(:page => params[:page], :per_page => 10)

      respond_to do |format|
        format.html
        format.js
      end
  end

    def destroy
  end
  def new
      @prem = Prem.new
  end
        private
    # Use callbacks to share common setup or constraints between actions.
    def set_prem
        @prem = Prem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prem_params
        params.require(:prem).permit(:card_security_number, :card_number)
    end
end