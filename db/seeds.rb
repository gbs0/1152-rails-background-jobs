if Rails.env.development?
  User.find_or_create_by!(email: "admin@email.com", password: "123#{ENV['SALT']}", admin: true)
end