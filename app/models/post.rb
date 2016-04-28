class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :subderrit
  has_many :pvotes
end
