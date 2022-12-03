class AddPausedToTimekeeper < ActiveRecord::Migration[5.0]
  def change
    add_column :timekeepers, :pause, :boolean
  end
end
