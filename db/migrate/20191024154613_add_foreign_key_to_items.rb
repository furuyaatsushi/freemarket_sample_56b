class AddForeignKeyToItems < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :items, :users, column: :saler_id
    add_foreign_key :items, :users, column: :buyer_id
  end
end
