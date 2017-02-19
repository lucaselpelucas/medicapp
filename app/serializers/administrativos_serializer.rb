class AdministrativosSerializer < ActiveModel::Serializer
  attributes :nacionalidad, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :nip, :permiso, :usuario, :sexo, :fecha_nacimiento, :puesto
  belongs_to :centros_medicos
end
