class CreateTexthints < ActiveRecord::Migration[5.0]
  def change
    create_table :texthints do |t|
      t.string :message

      t.timestamps
    end
  end
end
