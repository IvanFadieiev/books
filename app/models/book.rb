class Book < ActiveRecord::Base
  belongs_to :user
  with_options presence: :true do |book|
    book.validates :user
    book.validates :title
    book.validates :body
    book.validates :author
    book.validates :user_id
  end
end
