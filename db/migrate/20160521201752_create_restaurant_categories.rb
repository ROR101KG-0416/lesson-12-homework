class CreateRestaurantCategories < ActiveRecord::Migration
  def change
    remove_column :restaurant_categories, :character_id
    remove_column :restaurant_categories, :ability_id

    add_column :restaurant_categories, :restaurant_id, :integer
    add_column :restaurant_categories, :category_id, :integer
  end
end
