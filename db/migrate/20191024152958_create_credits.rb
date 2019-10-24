class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.string :number,           null: false
      t.string :month,            null: false
      t.string :year,             null: false
      t.string :security_code,    null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
