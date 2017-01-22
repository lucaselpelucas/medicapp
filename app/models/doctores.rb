class Doctores < ApplicationRecord
  belongs_to :centros_id, optional: true
  belongs_to :especialidades_id, optional: true
end
