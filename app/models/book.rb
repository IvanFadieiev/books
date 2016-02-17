class Book < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories
  has_attached_file :preview, :styles => { :medium => "140x200!", :large => "210x300!" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :preview, :content_type => /\Aimage\/.*\Z/
  with_options presence: :true do |book|
    book.validates :user
    book.validates :title
    book.validates :body
    book.validates :author
    book.validates :user_id
  end
end
