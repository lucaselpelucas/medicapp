class Doctores < ApplicationRecord
  belongs_to :centros_id
  belongs_to :especialidades_id
end
