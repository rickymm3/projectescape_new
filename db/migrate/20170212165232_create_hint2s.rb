class CreateHint2s < ActiveRecord::Migration[5.0]
  def change
    create_table :hint2s do |t|
      t.string :message

      t.timestamps
    end
  end
end
