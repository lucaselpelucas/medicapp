class CreateHoras < ActiveRecord::Migration[5.0]
  def change
    create_table :horas do |t|
      t.time :hora

      t.timestamps
    end
  end
end
