class AddNeighborhoodIdToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :neighborhood_id, :string
  end
end
