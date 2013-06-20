class UserMailer < ActionMailer::Base
  default form: "notifications@ex.com"
  
  
  def welcome_email(user)
    @user = user
    @url = "http://ex.com/login"
    mails(to: user.email, subject: "Welcome to my awsome website")
  end
  
  def reminder_email(user)
    @user = user
    @url = "http://ex.com/reminer"
    attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
    mails(to: "#{user.name} <#{user_email}>", subject: "Reminder for you")
  end
  
  #other email actions
  
end

u = User.find(123)

msg = UserMailer.welcome_email(u)
msg.deliver!

#in the layout

<html>
<head>
<%= yeild :head %>
<head>

<body>
<%= yield  %>
</body>
</html>

#in the view
<% content_for :head do %>
  
  
  <% end %>

#Queations
# 1. What is the purpose of @url in the mailer action
# 2. Where does attachments field go? Probably into the action

#what is h(user.name) and h(text)