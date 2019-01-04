class AddImgurlToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :imgurl, :string
  end
end
