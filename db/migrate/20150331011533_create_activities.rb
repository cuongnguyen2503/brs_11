class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user, index: true
      t.string :content

      t.timestamps null: false
    end
    add_foreign_key :activities, :users
  end
end
