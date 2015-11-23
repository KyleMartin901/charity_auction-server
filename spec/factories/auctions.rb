FactoryGirl.define do
  factory :auction do
    starts_at "2015-12-22 18:00:00"
    ends_at "2015-12-22 20:00:00"
    time_zone_id "Australia/Sydney"
    physical_address "123 Main St\nSydney NSW 2000"
    name "Charity Auction"
    donation_window_ends_at "2015-12-21 18:00:00"
  end

end
