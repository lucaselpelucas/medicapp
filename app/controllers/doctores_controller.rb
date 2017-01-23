class DoctoresController < ApplicationController
  before_action :set_doctore, only: [:show, :update, :destroy]

  # GET /doctores
  def index
    @doctores = Doctores.all

    render json: @doctores
  end

  # GET /doctores/1
  def show
    render json: @doctore
  end

  # POST /doctores
  def create
    binding.pry
    @doctore = Doctores.new(doctore_params)

    if @doctore.save
      render json: @doctore, status: :created, location: @doctore
    else
      render json: @doctore.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctores/1
  def update
    binding.pry
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

    # Only allow a trusted parameter "white list" through.
    def doctore_params
      params.permit(:centros_medicos_id, :nombre, :entrada, :salida, :universidad, :rssp, :cedulageneral, :cedulaespecial, :citasdia, :especialidades_id, :baja)
    end
end
