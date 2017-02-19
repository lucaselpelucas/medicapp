class CentrosMedicos < ApplicationRecord
  has_many :doctores
  has_many :administradores
  has_many :citas

  # validates :direccion, format: { with: /^[a-zA-Z 0-9#.]+$/ }
  # validates :colonia, format: { with: /^[a-zA-Z ]+$/ }
  # validates :telefono, format: { with: /^[0-9-]+$/ }
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
