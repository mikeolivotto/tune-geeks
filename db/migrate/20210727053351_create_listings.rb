class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name, null: false
      t.references :artist, null: false, foreign_key: true
      t.decimal :price, null: false
      t.text :description
      t.string :status, null: false
      t.references :seller, null: false, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
