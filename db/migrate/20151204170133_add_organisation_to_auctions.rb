class AddOrganisationToAuctions < ActiveRecord::Migration
  def change
    add_reference :auctions, :organisation, index: true, foreign_key: true, null: false
  end
end
