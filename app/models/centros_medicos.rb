class CentrosMedicos < ApplicationRecord
  has_many :doctores
  has_many :citas
end
