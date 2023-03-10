class UserMailer < ActionMailer::Base
    default from: "from@example.com"
    layout "mailer"

    def welcome(user_id)
      user = User.find(user_id)
      puts "Welcome #{user.username}"
    end
  end
  