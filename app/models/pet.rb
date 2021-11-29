class Pet < ApplicationRecord
    
    STATUS =['Ready for pickup','Under investigation','Documents needed','Animal is sick','Registered but not submitted']
    
    def self.search(search)
      if search
        where(["chip_number LIKE ?","#{search}"])
      else
        all
      end
    end
end
