class RemoveNeighborhoodToAndAddNeighborhoodToRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :neighbord_id
  end
end
