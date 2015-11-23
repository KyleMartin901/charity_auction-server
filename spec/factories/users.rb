FactoryGirl.define do
  factory :user do
    name "Kyle Martin"
    sequence(:mobile_phone_number) { |n| "+6149157015#{n}" }
    sequence(:email_address) { |n| "test-#{n}@test.com" }
    physical_address "123 Main St\nAnytown, NSW 2000 Australia"
  end

end
