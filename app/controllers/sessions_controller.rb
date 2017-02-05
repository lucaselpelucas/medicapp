class SessionsController < ApplicationController
  def create_admin
    data = params
    Rails.logger.error params.to_yaml
    debugger
    admin = Administradores.where(nip: data[:nip]).first
    head 406 and return unless admin
    if admin.nip == (data[:nip].to_i)
      admin.regenerate_token
      render json: admin, status: :created, meta: default_meta,
             serializer: ActiveModel::Serializer::AdministradoresSerializer and return
    end
    head 403
  end


  def create
    data = params #TODO:  ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    Rails.logger.error params.to_yaml
    paciente = Pacientes.where(folio: data[:folio]).first
    head 406 and return unless paciente
    if paciente.folio == (data[:folio])
      paciente.regenerate_token
      render json: paciente, status: :created, meta: default_meta,
             serializer: ActiveModel::Serializer::SessionSerializer and return
    end
    head 403
  end

  def destroy
    paciente = Pacientes.where(token: params[:id]).first
    head 404 and return unless user
    paciente.regenerate_token
    head 204
  end
end
