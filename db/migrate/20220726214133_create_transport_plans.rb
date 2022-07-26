class CreateTransportPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :transport_plans do |t|
      t.string :reference_no, null: false
      t.string :plan_type
      t.references :region, null: true, foreign_key: { to_table: :locations }

      t.timestamps
    end
  end
end
