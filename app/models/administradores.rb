class Administradores < ApplicationRecord
  belongs_to :centros_medicos
  scope :in_centros_medicos, lambda {|centros_medicos| joins(:centros_medicos).where('administradores.centros_medicos_id = ?',centros_medicos)}
  has_secure_token #Create admin table on database base it on pacientes

  # validates :primer_nombre, format: { with: /^[a-zA-Z]+$/ }
  # validates :segundo_nombre, format: { with: /^[a-zA-Z]+$/ }
  # validates :primer_apellido, format: { with: /^[a-zA-Z]+$/ }
  # validates :segundo_apellido, format: { with: /^[a-zA-Z]+$/ }
  # validates :nacionalidad, format: { with: /^[a-zA-Z]+$/ }
  # validates :sexo, format: { with: /^[a-zA-Z]+$/ }
  # validates :fecha_nacimiento, format: { with: /\A[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\z/i }
  # validates :puesto, format: { with: /^[a-zA-Z]+$/ }
  # validates :password, format: { with: /^\w+$/}
  # validates :password_digest, format: { with: /^\w+$/}

  # validates :permiso, format: { with: /^[0-9]+$/}
  # validates :usuario, format: { with: /^\w+$/}
end
