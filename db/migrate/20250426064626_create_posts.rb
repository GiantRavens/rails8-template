class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts, id: false do |t|
      t.string :id, primary_key: true, null: false
      t.string :title, null: false
      t.text :body
      t.boolean :is_published, default: false, null: false
      t.datetime :published_date
      t.timestamps
    end
  end
end
