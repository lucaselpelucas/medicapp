class PacientesSerializer < ActiveModel::Serializer
    attributes :id, :nacionalidad, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :centros_medicos_id, :poliza, :folio, :nombre, :sexo, :fecha_nacimiento, :curp, :parentesco, :regimen, :domicilio, :colonia, :cp, :ciudad, :estado, :validez_inicio, :validez_termino, :reafiliacion, :token)
    belongs_to :centros_medicos
end
