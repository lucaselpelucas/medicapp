class CentrosEspecialidadesSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :centros_medicos
  belongs_to :especialidades
end
