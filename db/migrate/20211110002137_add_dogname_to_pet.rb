class AddDognameToPet < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :dogname, :string
  end
end
