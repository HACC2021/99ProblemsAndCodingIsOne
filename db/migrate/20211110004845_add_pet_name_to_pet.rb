class AddPetNameToPet < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :petName, :string
  end
end
