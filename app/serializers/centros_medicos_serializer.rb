class CentrosMedicosSerializer < ActiveModel::Serializer
  attributes :id, :unidadmedica, :direccion, :colonia, :telefono, :general, :dental, :consultoriorosa, :epidemiologia, :pediatria, :hr_inicio, :hr_cierre
end
