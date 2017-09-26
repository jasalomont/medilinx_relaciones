class ChangeUnitsDefaultValueInRxes < ActiveRecord::Migration[5.0]
  def change
    change_column_default :rxes, :units, 'mg'
  end
end
