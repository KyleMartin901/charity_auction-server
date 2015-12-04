RSpec.describe Membership do
  describe "relationships" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :organisation }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :organisation }
  end
end
