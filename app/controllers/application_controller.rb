class ApplicationController < ActionController::API
  before_action :check_header
  before_action :validate_login

  private
  def check_header
    if ['POST','PUT','PATCH'].include? request.method
      if request.content_type != "application/vnd.api+json"
        head 406 and return
      end
    end
  end

  def validate_login
    token = request.headers["X-Api-Key"]
    return unless token
    paciente = Pacientes.find_by token: token
    return unless paciente
    if 15.minutes.ago < paciente.updated_at
      paciente.touch
      @current_paciente = paciente
    end
  end

  def validate_admin_login
    token = request.headers["X-Api-Key"]
    return unless token
    admin = Administradores.find_by token: token
    return unless admin
    if 60.minutes.ago < admin.updated_at
      admin.touch
      @current_admin = admin
    end
  end

  def validate_admin
    head 403 and return unless @current_admin
  end

  def validate_paciente
    head 403 and return unless @current_paciente
  end

  def default_meta
    {
      licence: 'CC-0',
      authors: ['DOVQ'],
      logged_in: (@current_paciente ? true : false)
    }
  end

  def validate_type
    if params['data'] && params['data']['type']
      if params['data']['type'] == params[:controller]
        return true
      end
    end
    head 409 and return
  end

  def render_error(resource, status)
    render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer, meta: default_meta
  end


end
