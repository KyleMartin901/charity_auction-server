class AuctionAdmin < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :auction, presence: true
  validates :user, presence: true

  validates_uniqueness_of :user_id, scope: :auction_id
end
