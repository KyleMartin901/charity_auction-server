class Bid < ActiveRecord::Base
  belongs_to :donation
  belongs_to :bidder, class_name: "User"

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true
  validates :placed_at, presence: true
  validates :donation, presence: true
  validates :bidder, presence: true

  validate :_quantity_between_1_and_donation_quantity

  def _quantity_between_1_and_donation_quantity
    return unless quantity && donation.try(:quantity)

    unless quantity.between?(1, donation.quantity)
      errors.add :quantity, "must be greater than or equal to #{donation.quantity}"
    end
  end
end
