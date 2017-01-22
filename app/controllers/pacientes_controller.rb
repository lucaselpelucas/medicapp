class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :update, :destroy]

  # GET /pacientes
  def index
    @pacientes = Pacientes.all

    render json: @pacientes
  end

  # GET /pacientes/1
  def show
    render json: @paciente
  end

  # POST /pacientes
  def create
    @paciente = Pacientes.new(paciente_params)

    if @paciente.save
      render json: @paciente, status: :created, location: @paciente
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pacientes/1
  def update
    if @paciente.update(paciente_params)
      render json: @paciente
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pacientes/1
  def destroy
    @paciente.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Pacientes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def paciente_params
      params.require(:paciente).permit(:centros_id, :poliza, :folio, :nombre, :sexo, :fecha_nacimiento, :curp, :parentesco, :regimen, :domicilio, :colonia, :cp, :ciudad, :estado, :validez_inicio, :validez_termino, :reafiliacion)
    end
end
