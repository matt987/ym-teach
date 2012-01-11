class CreateAlumnos < ActiveRecord::Migration
  def change
    create_table :alumnos do |t|
      t.string :nombre
      t.date :fecha_nacimiento
      t.string :documento
      t.integer :maestra_id

      t.timestamps
    end
  end
end
