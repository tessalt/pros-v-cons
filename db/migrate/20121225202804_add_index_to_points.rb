class AddIndexToPoints < ActiveRecord::Migration
  def change
    add_index :points, :list_id
  end
end
