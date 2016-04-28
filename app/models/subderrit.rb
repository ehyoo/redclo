class Subderrit < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :moderators, presence: true
  validates :moderators, length: { minimum: 1 }

  has_many :users_subderrits, dependent: :destroy
  has_many :users, through: :users_subderrits
  has_many :posts, dependent: :destroy
  serialize :moderators, Array
  serialize :blacklist, Array
end
