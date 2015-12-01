class BidType < ActiveRecord::Base
  has_many :donations
  
  validates :name, uniqueness: true, presence: true
end
