class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :heading
      t.integer :user_id
      t.datetime :published_date
      t.text :keywords
      t.text :resources
      t.datetime :end_date

      t.timestamps
    end
  end
end
