class CreateSubderrits < ActiveRecord::Migration
  def change
    create_table :subderrits do |t|
      t.string :name
      t.text :moderators
      t.text :blacklist

      t.timestamps null: false
    end
  end
end
