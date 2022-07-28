class ChangeTransportOfferItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :transport_offer_items, :transport_plan_item_id, :transport_bid_item_id
  end
end
