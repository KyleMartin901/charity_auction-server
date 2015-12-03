RSpec.describe Bid do
  describe "attributes" do
    it { is_expected.to have_attribute :amount }
    it { is_expected.to have_attribute :quantity }
    it { is_expected.to have_attribute :placed_at }
  end

  describe "relationships" do
    it { is_expected.to belong_to :donation }
    it { is_expected.to belong_to :bidder }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_presence_of :quantity }
    it { is_expected.to validate_presence_of :placed_at }
    it { is_expected.to validate_presence_of :donation }
    it { is_expected.to validate_presence_of :bidder }

    it { should validate_numericality_of(:amount).is_greater_than(0) }

    it "it validates that the quantity is between 1 and the donation's quantity" do
      subject.donation = Donation.new(quantity: 2)
      subject.quantity = 0
      subject.valid?
      expect(subject.errors[:quantity]).to include "must be greater than or equal to 2"
    end
  end
end
