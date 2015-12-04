RSpec.describe Donation do
  describe "attributes" do
    it { is_expected.to have_attribute :title }
    it { is_expected.to have_attribute :description }
    it { is_expected.to have_attribute :quantity }
    it { is_expected.to have_attribute :redemption_window_starts_at }
    it { is_expected.to have_attribute :redemption_window_ends_at }
    it { is_expected.to have_attribute :estimated_value_amount }
    it { is_expected.to have_attribute :minimum_bid_amount }
    it { is_expected.to have_attribute :display_description }
    it { is_expected.to have_attribute :admin_follow_up_needed }
    it { is_expected.to have_attribute :fulfillment_type }
  end

  describe "relationships" do
    it { is_expected.to belong_to :auction }
    it { is_expected.to belong_to :bid_type }
    it { is_expected.to belong_to :donor }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :auction }
    it { is_expected.to validate_presence_of :bid_type }
    it { is_expected.to validate_presence_of :donor }

    it { should validate_numericality_of(:quantity).is_greater_than(0) }
    it { should validate_numericality_of(:quantity).allow_nil }
    it { should validate_numericality_of(:estimated_value_amount).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:estimated_value_amount).allow_nil }
    it { should validate_numericality_of(:minimum_bid_amount).is_greater_than(0) }
    it { should validate_numericality_of(:minimum_bid_amount).allow_nil }

    it { should define_enum_for(:fulfillment_type).with([:item, :certificate]) }

    it "redemption_window_ends_at is after redemption_window_starts_at" do
      # Test that they can't be equal or before
      subject.redemption_window_starts_at = DateTime.new(2015,12,1,0,0)
      subject.redemption_window_ends_at = subject.redemption_window_starts_at
      subject.valid?
      expect(subject.errors[:redemption_window_ends_at]).to include "must be greater than redemption_window_starts_at"

      # Test that ends_at valid after starts_at
      subject.redemption_window_ends_at = subject.redemption_window_starts_at.advance(seconds: 1)
      subject.valid?
      expect(subject.errors[:redemption_window_ends_at]).to be_empty
    end
  end

  describe "defaults" do
    it "defaults admin_follow_up_needed to false" do
      expect(subject.admin_follow_up_needed).to eq false
    end

    it "defaults fulfillment_type to nil" do
      expect(subject.fulfillment_type).to be_nil
    end
  end
end
