class DoctoresSerializer < ActiveModel::Serializer
  attributes :id, :tipo_contratacion, :inicio_contratacion, :fin_contratacion, :nacionalidad, :primer_nombre, :segundo_nombre, :entrada, :salida, :universidad, :ssa, :cedula_profesional, :baja, :consultorio_asignado
  belongs_to :centros_medicos
  belongs_to :especialidades
end
