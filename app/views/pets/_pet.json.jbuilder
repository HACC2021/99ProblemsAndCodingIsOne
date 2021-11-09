json.extract! pet, :id, :chipNumber, :ownerName, :ownerAdress, :payment, :dateOfArrival, :created_at, :updated_at
json.url pet_url(pet, format: :json)
