class ChangeDollarsColumnsForDonations < ActiveRecord::Migration
  def change
    rename_column :donations, :estimated_value, :estimated_value_amount
    rename_column :donations, :minimum_bid, :minimum_bid_amount
  end
end
