class UserMailer < ActionMailer::Base
  default :from => "tellmewhen2@gmail.com"
  
  def new_user_email(user)
    @user = user
    # @url  = "http://TellMeWhen.com/78HHD7D77SD"
    mail(:to => user.email, :subject => "Welcome to Tell Me When - Your Marathon Reminder")
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
   @race_changed_value
   @is_it_new

      mail(:to => @user_search.user.email, :subject => "We've found new races that fit your search")
 end
 
 def auto_generated_user_email(user, password)
   # email the new user their auto generated password
   # the user password is useless since it has been encrypted
   
   @user = user
   @password = password
   
   mail(:to => user.email, :subject => "Welcome to Tell Me When - Your Marathon Reminder")
 end
 
end
