AdminUser.create(
      :id => 1,
      :email => "admin@example.com",
      :password => "password",
      :sign_in_count => 1,
      :current_sign_in_at => Time.now.yesterday,
      :last_sign_in_at => Time.now,
      :current_sign_in_ip => "127.0.0.1",
      :last_sign_in_ip => "127.0.0.1"
)
