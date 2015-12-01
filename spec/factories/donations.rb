FactoryGirl.define do
  factory :donation do
    title "MyString"
description "MyText"
quantity 1
auction nil
bid_type nil
donor nil
redemption_window_starts_at "2015-11-30 16:28:33"
redemption_window_ends_at "2015-11-30 16:28:33"
estimated_value 1
minimum_bid 1
display_description "MyText"
admin_follow_up_needed false
item_number "MyString"
fulfillment_type 1
  end

end
