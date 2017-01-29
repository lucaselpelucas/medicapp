class ApplicationController < ActionController::API
  before_action :check_header
  before_action :validate_login

  def validate_login
    binding.pry
    token = request.headers["X-Api-Key"]
    return unless token
    paciente = Pacientes.find_by token: token
    return unless paciente
    if 15.minutes.ago < paciente.updated_at
      paciente.touch
      @current_paciente = paciente
    end
  end

  def validate_user
    head 403 and return unless @current_paciente
  end

  def default_meta
    {
      licence: 'CC-0',
      authors: ['DOVQ'],
      logged_in: (@current_paciente ? true : false)
    }
  end

  private
  def check_header
    if ['POST','PUT','PATCH'].include? request.method
      if request.content_type != "application/vnd.api+json"
        head 406 and return
      end
    end
  end
  

  def validate_type
    if params['data'] && params['data']['type']
      if params['data']['type'] == params[:controller]
        return true
      end
    end
    head 409 and return
  end

  def validate_paciente
    token = request.headers["X-Api-Key"]
    head 403 and return unless token
    paciente = Paciente.find_by token: token
    head 403 and return unless paciente
  end

  def render_error(resource, status)
    render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
  end


end
