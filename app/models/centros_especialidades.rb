class CentrosEspecialidades < ApplicationRecord
  belongs_to :centros_medicos_id
  belongs_to :especialidades_id
end
