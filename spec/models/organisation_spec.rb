RSpec.describe Organisation do
  describe "attributes" do
    it { is_expected.to have_attribute :name }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
  end

  describe "relationships" do
    it { is_expected.to have_many :auctions }
    it { is_expected.to have_many :memberships }
  end
end
