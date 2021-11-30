class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :pets, :chipNumber, :chip_number
  end
end
