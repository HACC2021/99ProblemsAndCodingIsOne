class AddEmailToPet < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :email, :string
  end
end
