class CreateAdministrativos < ActiveRecord::Migration[5.0]
  def change
    create_table :administrativos do |t|
      t.string :nombre
      t.integer :nip
      t.integer :permiso
      t.string :usuario
      t.references :centros_medicos_id, foreign_key: true

      t.timestamps
    end
  end
end
