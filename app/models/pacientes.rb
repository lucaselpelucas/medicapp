class Pacientes < ApplicationRecord
  # belongs_to :centros_id, optional: true
    has_secure_token
    validates :POLIZA, :folio, presence: true
end
