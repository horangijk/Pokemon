class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.string :name
      t.string :move_type
      t.references :pokemon
      t.timestamps
    end
  end
end
