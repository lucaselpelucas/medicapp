class AdministradoresSerializer < ActiveModel::Serializer
  attributes :id, :primer_nombre, :centros_medicos, :nip, :token #nice stuff call relational data :centros_medicos
end
