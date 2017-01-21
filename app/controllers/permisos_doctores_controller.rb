class PermisosDoctoresController < ApplicationController
  before_action :set_permisos_doctore, only: [:show, :update, :destroy]

  # GET /permisos_doctores
  def index
    @permisos_doctores = PermisosDoctores.all

    render json: @permisos_doctores
  end

  # GET /permisos_doctores/1
  def show
    render json: @permisos_doctore
  end

  # POST /permisos_doctores
  def create
    @permisos_doctore = PermisosDoctores.new(permisos_doctore_params)

    if @permisos_doctore.save
      render json: @permisos_doctore, status: :created, location: @permisos_doctore
    else
      render json: @permisos_doctore.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /permisos_doctores/1
  def update
    if @permisos_doctore.update(permisos_doctore_params)
      render json: @permisos_doctore
    else
      render json: @permisos_doctore.errors, status: :unprocessable_entity
    end
  end

  # DELETE /permisos_doctores/1
  def destroy
    @permisos_doctore.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permisos_doctore
      @permisos_doctore = PermisosDoctores.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def permisos_doctore_params
      params.require(:permisos_doctore).permit(:doctores_id_id, :inicio_baja, :termino_baja)
    end
end
