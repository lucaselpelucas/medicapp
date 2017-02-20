class CitasController < ApplicationController
  before_action :set_cita, only: [:show, :update, :destroy, :cancel]

  # GET /citas
  def index
    # TODO una vez se tenga al usuario con sesion
    # @citas = Citas.where centros_id: :session.centros_id

    @citas = Citas.all
    render json: @citas.as_json(include: [:pacientes ,:centros_medicos, :doctores])
  end
  # POST /citasc
  # otorga las citas por centro
  def citascentro
    @citascetro = Citas.where(centros_medicos_id: params[:centros_medicos_id]).where(fecha: Date.today)
    render json: @citascetro.as_json(include: [:pacientes ,:centros_medicos, :doctores])
  end

  # GET /citas/1
  def show
    render json: @cita
  end

  # POST /citas
  def create
    @cita = Citas.new(cita_params)
    if @cita.save
      render json: @cita, status: :created, location: @cita
    else
      render json: @cita.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /citas/1
  def update
    if @cita.update(cita_params)
      render json: @cita
    else
      render json: @cita.errors, status: :unprocessable_entity
    end
  end

  def confirm
    @cita.estatus = params(:estatus)
    if @cita.update
      render json: @cita
    else
      render json: @cita.errors, status: :unprocessable_entity
    end
  end

  def cancel
    @cita.cancelada = params(:cancelada)
    if @cita.update
      render json: @cita
    else
      render json: @cita.errors, status: :unprocessable_entity
    end
  end

  def search
    @cita = Cita.where folio: params(:folio)
    render json: @cita
  end


  def show_doctor
    @cita = Cita.where doctor_id: params(:doctor_id)
    render json: @cita
  end


  # DELETE /citas/1
  def destroy
    @cita.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cita
      @cita = Citas.find(params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def cita_params
      params.permit(:pacientes_id, :folio, :tipo_cita, :fecha, :telefono, :hora, :estatus, :cancelada, :doctores_id, :especialidades_id)
    end
end
