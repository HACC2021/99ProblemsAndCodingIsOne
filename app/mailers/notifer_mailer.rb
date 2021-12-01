class NotiferMailer < ApplicationMailer
  
  def pet_notifications (pets)
    mail(to: pets.email , 
    from: "services@gmail.com" , 
    subject: "Pet Notification" , 
    body: "You've been signed up for notifications following your pet registration!")
  end
  
  def pet_ready (pets)
    mail(to: pets.email ,
    from: "services@gmail.com" ,
    subject: "Pet Is Ready" ,
    body: "Good news! Your pet is finally ready for pickup!")
  end
end
