class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :picture, null: false
      t.string :text, limit: 254, null: false
      t.timestamps
    end
  end
end
