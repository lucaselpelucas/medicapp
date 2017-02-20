class PermisosDoctoresSerializer < ActiveModel::Serializer
  attributes :id, :inicio_baja, :termino_baja, :tipo_permiso
  belongs_to :doctores
end
