class AdministradoresSerializer < ActiveModel::Serializer
  attributes :nacionalidad, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :nip, :permiso, :usuario, :centros_medicos_id, :sexo, :fecha_nacimiento, :puesto #nice stuff call relational data :centros_medicos
  belongs_to :centros_medicos
end
