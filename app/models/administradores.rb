class Administradores < ApplicationRecord
  belongs_to :centros_medicos
  scope :in_centros_medicos, lambda {|centros_medicos| joins(:centros_medicos).where('administradores.centros_medicos_id = ?',centros_medicos)}
  has_secure_token #Create admin table on database base it on pacientes
  has_secure_password
end
