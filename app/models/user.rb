class User < ActiveRecord::Base
  has_many :books, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
end
