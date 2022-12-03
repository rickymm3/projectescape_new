class AddRoomToHint < ActiveRecord::Migration[5.0]
  def change
    add_column :hints, :room, :string
  end
end
