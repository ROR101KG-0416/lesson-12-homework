class AddNeighborhoodToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :neighbord_id, :integer
  end
end
