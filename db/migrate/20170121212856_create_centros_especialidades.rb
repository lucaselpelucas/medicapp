class CreateCentrosEspecialidades < ActiveRecord::Migration[5.0]
  def change
    create_table :centros_especialidades do |t|
      t.references :centros_medicos, foreign_key: true
      t.references :especialidades, foreign_key: true

      t.timestamps
    end
  end
end
