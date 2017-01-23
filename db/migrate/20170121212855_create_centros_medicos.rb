class CreateCentrosMedicos < ActiveRecord::Migration[5.0]
  def change
    create_table :centros_medicos do |t|
      t.string :unidadmedica
      t.string :direccion
      t.string :colonia
      t.string :telefono
      t.string :general
      t.string :dental
      t.string :consultoriorosa
      t.string :epidemiologia
      t.string :pediatria
      t.time :hr_inicio
      t.time :hr_cierre

      t.timestamps
    end
  end
end
