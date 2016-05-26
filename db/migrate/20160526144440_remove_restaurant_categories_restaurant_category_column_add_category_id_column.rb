class RemoveRestaurantCategoriesRestaurantCategoryColumnAddCategoryIdColumn < ActiveRecord::Migration
  def change
  	add_column :restaurant_categories, :category_id, :integer
  	remove_column :restaurant_categories, :restaurant_category
  end
end
