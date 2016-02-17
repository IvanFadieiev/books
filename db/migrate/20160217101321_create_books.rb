class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.belongs_to :user
      t.string :title
      t.string :author
      t.text :body
      t.boolean :draft, default: false

      t.timestamps null: false
    end
  end
end
