class Citas < ApplicationRecord
  belongs_to :centros_medicos
  belongs_to :pacientes
  belongs_to :doctores
  validates :fecha ,:hora, presence: true
end
