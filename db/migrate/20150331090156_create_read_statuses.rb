class CreateReadStatuses < ActiveRecord::Migration
  def change
    create_table :read_statuses do |t|
      t.string :status
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :read_statuses, :users
    add_foreign_key :read_statuses, :books
  end
end
