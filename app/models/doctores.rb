class Doctores < ApplicationRecord
  belongs_to :centros_medicos
  belongs_to :especialidades
end
