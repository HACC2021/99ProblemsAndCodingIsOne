class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.integer :chipNumber
      t.string :ownerName
      t.string :ownerAdress
      t.boolean :payment
      t.date :dateOfArrival

      t.timestamps
    end
  end
end
