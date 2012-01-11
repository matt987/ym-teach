class AddMaestraIdToMaterias < ActiveRecord::Migration
  def change
    add_column :materias,:maestra_id, :integer
  end
end
