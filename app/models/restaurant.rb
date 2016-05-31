class Restaurant < ActiveRecord::Base
  belongs_to :neighborhood
  
  has_many :restaurant_categories
  has_many :categories, through: :restaurant_categories
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :postal_code, presence: true
  validates :neighborhood, presence: true
end
