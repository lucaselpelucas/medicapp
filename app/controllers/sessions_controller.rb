class SessionsController < ApplicationController
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