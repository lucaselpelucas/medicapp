class CreateDoctores < ActiveRecord::Migration[5.0]
  def change
    create_table :doctores do |t|
      t.references :centros_id, foreign_key: true
      t.string :nombre
      t.time :entrada
      t.time :salida
      t.string :universidad
      t.string :rssp
      t.string :cedulageneral
      t.string :cedulaespecial
      t.double :citasdia
      t.references :especialidades_id, foreign_key: true

      t.timestamps
    end
  end
end
