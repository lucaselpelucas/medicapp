class PacientesSerializer < ActiveModel::Serializer
    attributes :pacientes_id, :POLIZA, :folio, :user, :SP, :sp , :primer_nombre,:updated_at,:created_at
end
