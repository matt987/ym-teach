class CreateMaestras < ActiveRecord::Migration
  def change
    create_table :maestras do |t|
      t.string :nombre
      t.date :fecha_nacimiento
      t.string :documento
      t.integer :escuela_id

      t.timestamps
    end
  end
end
