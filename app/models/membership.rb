class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation

  validates :user, presence: true
  validates :organisation, presence: true
end
