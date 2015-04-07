class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true
      t.string :content
      t.string :solve, default: "pending"

      t.timestamps null: false
    end
    add_foreign_key :requests, :users
  end
end
