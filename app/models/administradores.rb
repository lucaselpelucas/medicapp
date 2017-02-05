class Administradores < ApplicationRecord
  has_secure_token #Create admin table on database base it on pacientes
end
