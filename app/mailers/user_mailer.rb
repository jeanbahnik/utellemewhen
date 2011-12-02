class UserMailer < ActionMailer::Base
  default :from => "hi@utellmewhen.com"
  # layout "user_mailer"
  
  def new_user_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to uTellmewhen - Your Marathon Reminder")
  end
  
 def race_mailer(user, race, race_changed_value, is_it_new)

   @user = user
   @race = race
   @race_changed_value
   @is_it_new
   
   mail(:to => user.email, :subject => "Success")
 
 end
 
 def search_mailer(user_search, race, race_changed_value, is_it_new)
   @user_search = user_search
   @race = race

      mail(:to => @user_search.user.email, :subject => "We've found a new race that fits your search")
 end
 
 def auto_generated_user_email(user, password, betold)
   # email the new user their auto generated password
   # the user password is useless since it has been encrypted
   
   @user = user
   @password = password
   @betold = betold

   mail(:to => user.email, :subject => "Welcome to uTellmewhen - Your Marathon Reminder", :bcc => "jean@utellmewhen.com")
 end
end