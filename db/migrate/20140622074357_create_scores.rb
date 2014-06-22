class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :thing, index: true, null: false
      t.references :user, index: true, null: false
      t.integer :value, null: false

      t.timestamps

      t.index [ :thing_id, :user_id ], unique: true
    end
  end
end
