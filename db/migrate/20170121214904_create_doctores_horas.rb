class CreateDoctoresHoras < ActiveRecord::Migration[5.0]
  def change
    create_table :doctores_horas do |t|
      t.references :doctores_id, foreign_key: true
      t.references :horas_id, foreign_key: true

      t.timestamps
    end
  end
end
