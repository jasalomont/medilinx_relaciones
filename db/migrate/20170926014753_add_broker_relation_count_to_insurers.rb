class AddBrokerRelationCountToInsurers < ActiveRecord::Migration[5.0]
  def change
    add_column :insurers, :broker_relations_count, :integer
  end
end
