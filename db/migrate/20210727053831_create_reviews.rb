class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :rating, null: false
      t.text :review
      t.references :reviewer, null: false, foreign_key: { to_table: :profiles }
      t.references :reviewee, null: false, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
