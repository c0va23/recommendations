class AddApprovedToThings < ActiveRecord::Migration
  def change
    add_column :things, :approved, :boolean, null: true, default: nil
  end
end
