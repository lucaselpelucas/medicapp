class PermisosDoctores < ApplicationRecord
  belongs_to :doctores_id, optional: true
end
