RSpec.describe AuctionAdmin do
  describe "attributes" do
    it { is_expected.to belong_to :auction }

    it { is_expected.to belong_to :user }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :auction }

    it { is_expected.to validate_presence_of :user }

    it "validates the uniqueness of user_id scoped to auction_id" do
      # Need to create databse entries for the auction, user and auction_admin
      # before being able to test the uniqueness of user_id and auction_id using
      # shoula matches
      auction = FactoryGirl.create(:auction)
      user = FactoryGirl.create(:user)

      FactoryGirl.create(:auction_admin, auction_id: auction.id, user_id: user.id)

      is_expected.to validate_uniqueness_of(:user_id).scoped_to(:auction_id)
    end
  end
end
