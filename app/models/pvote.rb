class Pvote < ActiveRecord::Base
  #validates :Pvote, uniqueness: { scope: [:post_id, :user_id] }
  belongs_to :user
  belongs_to :post
end
