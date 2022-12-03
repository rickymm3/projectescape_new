class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :heading
      t.string :identifier

      t.timestamps
    end
  end
end
