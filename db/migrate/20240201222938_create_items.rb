class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :item_name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shopping_fee_burden_id, null: false
      t.integer :origin_region_id, null: false
      t.integer :days_to_ship_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end


