class CentrosEspecialidadesController < ApplicationController
  before_action :set_centros_especialidade, only: [:show, :update, :destroy]

  # GET /centros_especialidades
  def index
    @centros_especialidades = CentrosEspecialidades.all

    render json: @centros_especialidades
  end

  # GET /centros_especialidades/1
  def show
    render json: @centros_especialidade
  end

  # POST /centros_especialidades
  def create
    @centros_especialidade = CentrosEspecialidades.new(centros_especialidade_params)

    if @centros_especialidade.save
      render json: @centros_especialidade, status: :created, location: @centros_especialidade
    else
      render json: @centros_especialidade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /centros_especialidades/1
  def update
    if @centros_especialidade.update(centros_especialidade_params)
      render json: @centros_especialidade
    else
      render json: @centros_especialidade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /centros_especialidades/1
  def destroy
    @centros_especialidade.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centros_especialidade
      @centros_especialidade = CentrosEspecialidades.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def centros_especialidade_params
      params.require(:centros_especialidade).permit(:centros_medicos_id, :especialidades_id)
    end
end
