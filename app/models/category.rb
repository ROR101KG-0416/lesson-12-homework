class Category < ActiveRecord::Base
  has_many :restaurant_categories
  has_many :categories, through: :restaurant_categories

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
