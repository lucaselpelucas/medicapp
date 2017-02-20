class DoctoresController < ApplicationController
  before_action :check_header
  before_action :set_doctorecentro, only: [:showoncentro]
  before_action :set_doctore, only: [:show, :update, :destroy]
  before_action :validate_admin_login, only:[:index,:create,:update,:destroy]
  before_action :validate_admin, only: [:index,:create, :update, :destroy]
  # reparar este before action before_action :validate_type, only: [:create, :update]

  # GET /doctores
  def index
    @doctores = Doctores.all

    render json: @doctores
  end

  # GET /doctores/1
  def show
    render json: @doctore
  end
  # GET /doctorescentro/1
  def showoncentro
    if @doctorescentro.any?
      render json: @doctorescentro
    else
      render json: @doctorescentro, status: 404
    end
  end

  # POST /doctores
  def create
    @doctore = Doctores.new(doctore_params)

    if @doctore.save
      render json: @doctore, status: :created, location: @doctore
    else
      render json: @doctore.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctores/1
  def update
    if @doctore.update(doctore_params)
      render json: @doctore
    else
      render json: @doctore.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctores/1
  def destroy
    @doctore.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctore
      @doctore = Doctores.find(params[:id])
    end

    def set_doctorecentro
      @doctorescentro = Doctores.all.where(centros_medicos_id: params[:id_centro]).where("baja = ? OR baja is ?",0,nil)
    end

    # Only allow a trusted parameter "white list" through.
    def doctore_params
      params.require(:doctores).permit(:tipo_contratacion, :inicio_contratacion, :fin_contratacion, :nacionalidad, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :centros_medicos_id, :entrada, :salida, :universidad, :ssa, :cedula_profesional, :especialidades_id, :baja, :consultorio_asignado)

      # params.permit(:centros_medicos_id, :primer_nombre, :ENTRADA, :salida, :SALIDA, :UNIVERSIDAD,
      #  :cedula_profesional, :SSA, :estatus, :especialidades_id, :baja, :segundo_nombre, :primer_apellido ,
      #  :segundo_apellido, :nacionalidad, :consultorio_asignado, :tipo_contratacion, :inicio_contratacion, :fin_contratacion)
    end
end
