class Pvote < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :post_id
  belongs_to :user
  belongs_to :post
  after_create :recount_pvotes
  after_destroy :recount_pvotes
  after_update :recount_pvotes

  def recount_pvotes
    post = self.post
    val = 0
    post.pvotes.each do |vote|
      val = val + vote.value
    end
    post.net_votes = val
    post.save
  end
end
