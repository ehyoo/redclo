# Vote specifically for comments
class Cvote < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :comment_id
  belongs_to :user
  belongs_to :comment
  after_create :recount_cvotes
  after_destroy :recount_cvotes
  after_update :recount_cvotes

  def recount_cvotes
    comment = self.comment
    val = 0
    comment.cvotes.each do |vote|
      val += vote.value
    end
    comment.net_votes = val
    comment.save
  end
end
