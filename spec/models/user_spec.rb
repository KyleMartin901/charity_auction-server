RSpec.describe User do
  ["name", "mobile_phone_number", "email_address", "physical_address"].each do |required_attribute|
    it { is_expected.to have_attribute required_attribute }

    it { is_expected.to validate_presence_of required_attribute }
  end

  ["mobile_phone_number", "email_address"].each do |unique_attribute|
    it "validates uniqueness of #{unique_attribute}" do
      subject = FactoryGirl.create(:user)
    end
  end

  describe "relationships" do
    it { is_expected.to have_many :auction_admins }
    it { is_expected.to have_many :donations }
  end
end
