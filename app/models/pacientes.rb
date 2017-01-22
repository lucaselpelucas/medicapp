class Pacientes < ApplicationRecord
  belongs_to :centros_id, optional: true
end
