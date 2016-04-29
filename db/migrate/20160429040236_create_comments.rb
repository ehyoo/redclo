class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, index: true, foreign_key: true
      t.belongs_to :op_comment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
