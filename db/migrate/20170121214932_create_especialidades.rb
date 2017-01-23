class CreateEspecialidades < ActiveRecord::Migration[5.0]
  def change
    create_table :especialidades do |t|
      t.string :nombre
      t.integer :estatus

      t.timestamps
    end
  end
end
