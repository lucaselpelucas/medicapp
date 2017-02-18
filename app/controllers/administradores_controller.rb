class AdministradoresController < ApplicationController
  before_action :set_administrador, only: [:show]

  #POST

  #GET
  # GET /doctores/1
  def show
    render json: @administrador
  end

  #UPDATE

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrador
      @administrador = Administradores.in_centros_medicos(params[:id]).find(params[:idu])
    end

    # Only allow a trusted parameter "white list" through.
    def administrador_params
      params.permit(:centros_medicos_id, :primer_nombre, :ENTRADA, :salida, :SALIDA, :UNIVERSIDAD,
       :cedula_profesional, :SSA, :estatus, :especialidades_id, :baja, :segundo_nombre, :primer_apellido ,
       :segundo_apellido, :nacionalidad, :consultorio_asignado, :tipo_contratacion, :inicio_contratacion, :fin_contratacion)
    end
end
