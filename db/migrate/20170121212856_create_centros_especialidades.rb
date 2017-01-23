class CreateCentrosEspecialidades < ActiveRecord::Migration[5.0]
  def change
    create_table :centros_especialidades do |t|
      t.references :centros_medicos_id, foreign_key: true
      t.references :especialidades_id, foreign_key: true

      t.timestamps
    end
  end
end
