class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :update, :destroy]
  before_action :validate_paciente, only: [:create, :update, :destroy]
  #before_action :validate_type, only: [:create, :update]

  # GET /pacientes
  def index
    @pacientes = Pacientes.all
    render json: @pacientes
  end
  def lookadmin

  end

  def searchorcreate
     post = params[:user]
      #pass = params[:pass]
      # soapcall in console
      #TODO:: change to controller login http://savonrb.com/version2/response.html
      client = Savon.client do
        strip_namespaces false
        wsdl "http://n13.saludsonora.gob.mx:8081/WebServiceAM/SeguroPopular/datosPoliza.asmx?WSDL"
      end
      #client = Savon.client(wsdl:"http://n13.saludsonora.gob.mx:8081/WebServiceAM/SeguroPopular/datosPoliza.asmx?WSDL")
      #response = client.call(:obtener, message: {int64FolioPoliza: "2606292392",strPassword: "ytgftfyg01"})
      response = client.call(:obtener_xml) do
        message int64FolioPoliza: post, strPassword: "ytgftfyg01"
        advanced_typecasting true
        response_parser :nokogiri
      end
      debugger
      # TODO: hay que convertirlo a json para manipularlo de una mejor manera
      #render json: response
    #declaramos la variable para poder manipularla con facilidad en la siguientes lineas
    #TODO: call response succes and validate response.susses?
    sata = []
    sata.push(response.body[:obtener_xml_response][:obtener_xml_result][:beneficiario])
    sata.each do |list|
      debugger
      folio = list[:int64_folio_poliza] + "-" + list[:int_id_beneficiario]
      paciente = Pacientes.find_by(folio: folio)
      if paciente.blank?
        centro = CentrosMedicos.find_by(clues: list[:str_clues])
        if centro.blank?
          centro = CentrosMedicos.new(UNIDADMEDICA: list[:str_unidad_medica],clues: list[:str_clues])
          if centro.save
            p "centro saved"
          else
            p "centro tuvo problema"# render json: centro.errors, status: :unprocessable_entity
          end
        end
        d = DateTime.now()
        idkey = d.strftime("%H%M%S%Y%m%d") + folio[-4..-1]
        paciente = Pacientes.new(centros_medicos_id: centro.centros_medicos_id ,POLIZA: list[:int64_folio_poliza],
        folio: idkey, SP: folio,primer_nombre: list[:str_nombres],fecha_nacimiento: list[:dt_ffecha_nacimiento],
        CURP: list[:str_curp], SEXO: list[:chr_sexo] )
        if paciente.save
          p "paciente saved" #render json: paciente, status: :created
        else
          p "paciente previeamente registrado"#render json: paciente.errors, status: :unprocessable_entity
        end
      else
        p "paciente existe en nuesta db"
      end
      #TODO: terminar de guardar los usuarios y despues generar el token\
    end
    render json: sata
  end
  # GET /pacientes/1
  def show
    render json: @paciente
  end

  def get_pacientes_poliza
    post = params[:folio]
    results = Pacientes.find_by(SP: post)
    render json: results

  end

  # POST /pacientes
  def create
    @paciente = Pacientes.new(paciente_params)

    if @paciente.save
      render json: @paciente, status: :created
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pacientes/1
  def update
    if @paciente.update(paciente_params)
      render json: @paciente
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pacientes/1
  def destroy
    @paciente.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      begin
        @paciente = Pacientes.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        paciente = Pacientes.new
        paciente.errors.add(:id, "Wrong ID provided")
        render_error(paciente,404) and return
      end
    end

    # Only allow a trusted parameter "white list" through.
    def paciente_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
