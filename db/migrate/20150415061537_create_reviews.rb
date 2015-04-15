class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating_point
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :books
  end
end
