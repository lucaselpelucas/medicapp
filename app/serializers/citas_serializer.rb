class CitasSerializer < ActiveModel::Serializer
  attributes :id, :folio, :tipo_cita, :fecha, :telefono, :hora, :atendido, :ausente, :sp
  belongs_to :especialidades_id
  belongs_to :doctores_id
  belongs_to :pacientes_id
end
