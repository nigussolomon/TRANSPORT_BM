class CreateTransportOfferItems < ActiveRecord::Migration[7.0]
  def change
    create_table :transport_offer_items do |t|
      t.references :transport_offer, null: false, foreign_key: true
      t.references :transport_plan_item, null: false, foreign_key: true
      t.float :price, null: false
      t.string :winner
      t.boolean :rank

      t.timestamps
    end
  end
end
