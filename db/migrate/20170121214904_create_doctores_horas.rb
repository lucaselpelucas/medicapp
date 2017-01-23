class CreateDoctoresHoras < ActiveRecord::Migration[5.0]
  def change
    create_table :doctores_horas do |t|
      t.references :doctores, foreign_key: true
      t.references :horas, foreign_key: true

      t.timestamps
    end
  end
end
