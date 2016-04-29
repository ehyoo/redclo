class CreateCvotes < ActiveRecord::Migration
  def change
    create_table :cvotes do |t|
      t.integer :value
      t.references :user, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
