class CreateBrokerRelations < ActiveRecord::Migration
  def change
    create_table :broker_relations do |t|
      t.integer :patient_id
      t.integer :insurer_id
      t.string :insurance_company
      t.boolean :permission

      t.timestamps

    end
  end
end
