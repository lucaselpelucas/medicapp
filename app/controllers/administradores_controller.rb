class AdministradoresController < ApplicationController
  before_action :set_administrador, only: [:show]

  #POST
  def create
    @administrador = Administradores.new(administrador_params)
    if @administrador.save
      render json: @administrador, status: :created
    else
      render_error(@administrador, :unprocessable_entity)
    end
  end

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
      # params.permit(:centros_medicos_id, :primer_nombre, :ENTRADA, :salida, :SALIDA, :UNIVERSIDAD,
      #  :cedula_profesional, :SSA, :estatus, :especialidades_id, :baja, :segundo_nombre, :primer_apellido ,
      #  :segundo_apellido, :nacionalidad, :consultorio_asignado, :tipo_contratacion, :inicio_contratacion, :fin_contratacion)
      params.require(:administradores).permit(:nacionalidad, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :nip, :permiso, :usuario, :centros_medicos_id, :sexo, :fecha_nacimiento, :puesto)

    end
end
