class AdministrativosController < ApplicationController
  before_action :set_administrativo, only: [:show, :update, :destroy]

  # GET /administrativos
  def index
    @administrativos = Administrativos.all

    render json: @administrativos
  end

  # GET /administrativos/1
  def show
    render json: @administrativo
  end

  # POST /administrativos
  def create
    @administrativo = Administrativos.new(administrativo_params)

    if @administrativo.save
      render json: @administrativo, status: :created, location: @administrativo
    else
      render json: @administrativo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /administrativos/1
  def update
    if @administrativo.update(administrativo_params)
      render json: @administrativo
    else
      render json: @administrativo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /administrativos/1
  def destroy
    @administrativo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrativo
      @administrativo = Administrativos.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def administrativo_params
      params.require(:administrativo).permit(:nombre, :nip, :permiso, :usuario, :centros_id)
    end
end
