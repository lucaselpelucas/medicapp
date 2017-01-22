class CentrosMedicosController < ApplicationController
  before_action :set_centros_medico, only: [:show, :update, :destroy]

  # GET /centros_medicos
  def index
    @centros_medicos = CentrosMedicos.all

    render json: @centros_medicos
  end

  # GET /centros_medicos/1
  def show
    render json: @centros_medico
  end

  # POST /centros_medicos
  # def create
  #   @centros_medico = CentrosMedicos.new(centros_medico_params)

  #   if @centros_medico.save
  #     render json: @centros_medico, status: :created, location: @centros_medico
  #   else
  #     render json: @centros_medico.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /centros_medicos/1
  # def update
  #   if @centros_medico.update(centros_medico_params)
  #     render json: @centros_medico
  #   else
  #     render json: @centros_medico.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /centros_medicos/1
  # def destroy
  #   @centros_medico.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centros_medico
      @centros_medico = CentrosMedicos.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def centros_medico_params
      params.require(:centros_medico).permit(:unidadmedica, :direccion, :colonia, :telefono, :general, :dental, :consultoriorosa, :epidemiologia, :pediatria, :hr_inicio, :hr_cierre)
    end
end
