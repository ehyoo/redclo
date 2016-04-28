class CreatePvotes < ActiveRecord::Migration
  def change
    create_table :pvotes do |t|
      t.integer :value

      t.timestamps null: false
    end
  end
end
