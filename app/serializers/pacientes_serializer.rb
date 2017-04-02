class PacientesSerializer < ActiveModel::Serializer
    attributes :pacientes_id, :POLIZA, :folio, :SEXO, :fecha_nacimiento, :CURP, :SP , :primer_nombre,:updated_at,:created_at
end
