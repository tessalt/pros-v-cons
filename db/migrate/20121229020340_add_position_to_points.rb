class AddPositionToPoints < ActiveRecord::Migration
  def change
    add_column :points, :position, :integer
  end
end
