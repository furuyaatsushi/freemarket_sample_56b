class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,                     null: false
      t.text :description,                null: false
      t.string :status,                   null: false
      t.string :size
      t.string :shipping_charge,          null: false
      t.string :days_before_shipment,     null: false
      t.integer :price,                   null: false
      t.integer :saler_id,                null: false, foreign_key: true
      t.integer :buyer_id,                null: false, foreign_key: true
      t.references :prefecture,           null: false, foreign_key: true
      t.references :category,             null: false, foreign_key: true
      t.references :brand,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
