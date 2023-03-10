class UserJob < ApplicationJob
    def perform(user_id)
        UserMailer.welcome(user_id).deliver_later
    end
end