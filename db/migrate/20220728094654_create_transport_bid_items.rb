class CreateTransportBidItems < ActiveRecord::Migration[7.0]
  def change
    create_table :transport_bid_items do |t|
      t.references :transport_bid, null: false, foreign_key: true
      t.references :transport_plan_item, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.references :unit, null: false, foreign_key: { to_table: :unit_of_measures }

      t.timestamps
    end
  end
end
