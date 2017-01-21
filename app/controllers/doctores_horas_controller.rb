class DoctoresHorasController < ApplicationController
  before_action :set_doctores_hora, only: [:show, :update, :destroy]

  # GET /doctores_horas
  def index
    @doctores_horas = DoctoresHoras.all

    render json: @doctores_horas
  end

  # GET /doctores_horas/1
  def show
    render json: @doctores_hora
  end

  # POST /doctores_horas
  def create
    @doctores_hora = DoctoresHoras.new(doctores_hora_params)

    if @doctores_hora.save
      render json: @doctores_hora, status: :created, location: @doctores_hora
    else
      render json: @doctores_hora.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctores_horas/1
  def update
    if @doctores_hora.update(doctores_hora_params)
      render json: @doctores_hora
    else
      render json: @doctores_hora.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctores_horas/1
  def destroy
    @doctores_hora.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctores_hora
      @doctores_hora = DoctoresHoras.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doctores_hora_params
      params.require(:doctores_hora).permit(:doctores_id_id, :horas_id_id)
    end
end
