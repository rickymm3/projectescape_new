class CreateHints < ActiveRecord::Migration[5.0]
  def change
    create_table :hints do |t|
      t.string :message

      t.timestamps null: false
    end
  end
end
