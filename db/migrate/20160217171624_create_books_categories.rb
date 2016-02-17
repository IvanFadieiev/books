class CreateBooksCategories < ActiveRecord::Migration
  def change
    create_table :books_categories, id: false do |t|
      t.integer :category_id
      t.integer :book_id
    end
    add_index :books_categories, [:category_id, :book_id], unique: true
    add_index :books_categories, [:book_id, :category_id], unique: true
  end
end
