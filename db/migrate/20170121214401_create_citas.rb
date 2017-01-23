class CreateCitas < ActiveRecord::Migration[5.0]
  def change
    create_table :citas do |t|
      t.references :pacientes_id, foreign_key: true
      t.string :folio
      t.string :tipo_cita
      t.date :fecha
      t.string :telefono
      t.time :hora
      t.integer :estatus
      t.integer :cancelada
      t.references :doctores_id, foreign_key: true
      t.references :especialidades_id, foreign_key: true

      t.timestamps
    end
  end
end
