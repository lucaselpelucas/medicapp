class HorasController < ApplicationController
  before_action :set_hora, only: [:show, :update, :destroy]

  # GET /horas
  def index
    @horas = Horas.all

    render json: @horas
  end

  # GET /horas/1
  def show
    render json: @hora
  end

  # POST /horas
  def create
    @hora = Horas.new(hora_params)

    if @hora.save
      render json: @hora, status: :created, location: @hora
    else
      render json: @hora.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /horas/1
  def update
    if @hora.update(hora_params)
      render json: @hora
    else
      render json: @hora.errors, status: :unprocessable_entity
    end
  end

  # DELETE /horas/1
  def destroy
    @hora.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hora
      @hora = Horas.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hora_params
      params.require(:hora).permit(:hora)
    end
end
