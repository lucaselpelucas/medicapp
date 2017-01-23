class CreateDoctores < ActiveRecord::Migration[5.0]
  def change
    create_table :doctores do |t|
      t.references :centros_medicos, foreign_key: true
      t.string :nombre
      t.time :entrada
      t.time :salida
      t.string :universidad
      t.string :rssp
      t.string :cedulageneral
      t.string :cedulaespecial
      t.integer :citasdia
      t.references :especialidades, foreign_key: true
      t.integer :baja

      t.timestamps
    end
  end
end
