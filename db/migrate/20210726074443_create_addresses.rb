class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_one, null: false
      t.string :address_two
      t.string :city, null: false
      t.string :state, null: false
      t.integer :postcode, null: false
      t.string :country, null: false
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
