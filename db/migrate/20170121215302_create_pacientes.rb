class CreatePacientes < ActiveRecord::Migration[5.0]
  def change
    create_table :pacientes do |t|
      t.references :centros_id, foreign_key: true
      t.string :poliza
      t.string :folio
      t.string :nombre
      t.string :sexo
      t.date :fecha_nacimiento
      t.string :curp
      t.string :parentesco
      t.string :regimen
      t.text :domicilio
      t.string :colonia
      t.double :cp
      t.string :ciudad
      t.string :estado
      t.date :validez_inicio
      t.date :validez_termino
      t.date :reafiliacion

      t.timestamps
    end
  end
end
