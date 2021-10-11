class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :product, null: false, foreign_key: true
      t.float :rating
      t.string :review

      t.timestamps
    end
  end
end
