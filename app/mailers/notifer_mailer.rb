class NotiferMailer < ApplicationMailer
  
  def pet_notifications(pets)
    mail(to: pets.email , 
    from: "services@gmail.com" , 
    subject: "Pet Notification" , 
    body: "You've been signed up for notifications following your pet registration!")
  end
  
  def pet_ready(pets)
    mail(to: pets.email ,
    from: "services@gmail.com" ,
    subject: "Pet Is Ready" ,
    body: "Good news! Your pet is finally ready for pickup! Please come by the office with your pet's chip id.")
  end
  
  def pet_doc_needed(pets)
    mail(to: pets.email ,
    from: "services@gmail.com" ,
    subject: "Additional documents required" ,
    body: "Dear petowner, we require additional documents to process your pet. Please come by the office.")
  end
  
  def pet_ill(pets)
    mail(to: pets.email ,
    from: "services@gmail.com" ,
    subject: "Your pet is ill" ,
    body: "Dear petowner, we regret to inform you that your pet is currently ill. It will need to stay in quarantine.")
  end
end
