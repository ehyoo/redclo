class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.belongs_to :subderrit, index: true
      t.belongs_to :user, index: true
      t.integer :net_votes

      t.timestamps null: false
    end
  end
end
