class CreateUsersSubderrits < ActiveRecord::Migration
  def change
    create_table :users_subderrits do |t|
      t.references :subderrit, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
