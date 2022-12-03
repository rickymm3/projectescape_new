class CreateTimekeepers < ActiveRecord::Migration[5.0]
  def change
    create_table :timekeepers do |t|
      t.string :room
      t.timestamp :start
      t.timestamp :end

      t.timestamps
    end
  end
end
