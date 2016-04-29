class CreatePvotes < ActiveRecord::Migration
  def change
    create_table :pvotes do |t|
      t.integer :value
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
