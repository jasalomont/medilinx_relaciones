class CreateRxes < ActiveRecord::Migration
  def change
    create_table :rxes do |t|
      t.integer :prescription_id
      t.string :drug
      t.string :dose
      t.integer :quantity
      t.string :units
      t.text :details
      t.integer :time_spread
      t.string :time_spread_unit

      t.timestamps

    end
  end
end
