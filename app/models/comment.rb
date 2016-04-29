class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :op_comment, :class_name => "Comment"
  has_many :replies, :class_name => "Comment", dependent: :destroy
  has_many :cvotes
end
