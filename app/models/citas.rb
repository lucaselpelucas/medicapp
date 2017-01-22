class Citas < ApplicationRecord
  belongs_to :pacientes_id, optional: true
end
