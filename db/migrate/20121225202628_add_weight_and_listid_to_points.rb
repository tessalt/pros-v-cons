class AddWeightAndListidToPoints < ActiveRecord::Migration
  def change
    add_column :points, :list_id, :integer
    add_column :points, :weight, :integer, :default => 1
  end
end
