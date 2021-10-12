class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews

  def calculate_rating
    rating = Review.where(:product_id => self.id).average(:rating)
    self.update(rating: rating)
    rating
  end
end
