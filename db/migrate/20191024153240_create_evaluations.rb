class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.integer :evaluation,   null: false
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
