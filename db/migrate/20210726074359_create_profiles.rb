class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :username, null: false
      t.string :first_name, null: false
      t.string :last_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
