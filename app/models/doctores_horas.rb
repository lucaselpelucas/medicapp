class DoctoresHoras < ApplicationRecord
  belongs_to :doctores_id
  belongs_to :horas_id
end
