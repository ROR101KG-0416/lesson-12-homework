class AddNeighborhoodIdToAndRemoveNeighborhoodFromRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :neighborhood_id, :integer
    remove_column :restaurants, :neighborhood
  end
end
