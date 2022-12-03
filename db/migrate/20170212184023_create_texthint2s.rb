class CreateTexthint2s < ActiveRecord::Migration[5.0]
  def change
    create_table :texthint2s do |t|
      t.string :message

      t.timestamps
    end
  end
end
