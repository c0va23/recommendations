class CreateTagOfThings < ActiveRecord::Migration
  def change
    create_table :tag_of_things do |t|
      t.references :tag, index: true, null: false
      t.references :thing, index: true, null: false

      t.timestamps
    end

    add_index :tag_of_things, [ :tag_id, :thing_id ], unique: true
  end
end
