class AddStatusToPet < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :status, :string
  end
end
