class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews

  def calculate_rating
    ratings = self.reviews
                  .reject{|review| review.rating.nil?}
                  .sum(&:rating)
    final_rating = (ratings / self.reviews.count)
    self.update(rating: final_rating)
    final_rating
  end
end
