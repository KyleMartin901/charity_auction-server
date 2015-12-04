FactoryGirl.define do
  factory :membership do
    association :organisation, strategy: :build
    association :user, strategy: :build
  end

end
