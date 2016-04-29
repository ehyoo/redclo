class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :post, index: true, foreign_key: true
      t.belongs_to :op_comment, index: true, foreign_key: true
      t.references :replies, index: true, foreign_key: true
      t.integer :comment_id
      t.integer :net_votes

      t.timestamps null: false
    end
  end
end
