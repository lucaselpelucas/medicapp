class CreatePermisosDoctores < ActiveRecord::Migration[5.0]
  def change
    create_table :permisos_doctores do |t|
      t.references :doctores_id, foreign_key: true
      t.date :inicio_baja
      t.date :termino_baja

      t.timestamps
    end
  end
end
