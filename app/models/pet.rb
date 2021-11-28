class Pet < ApplicationRecord
    
    STATUS =['Ready for pickup','Under investigation','Documents needed','Animal is sick','Registered but not submitted']
    
    def searchChipNo(chipNumber)
      if chipNumber
        where(["chipNumber LIKE ?","%#{chipNumber}%"])
      else
        all
      end
    end
end
