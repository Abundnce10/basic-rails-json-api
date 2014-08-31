User.destroy_all
ApiKey.destroy_all
Role.destroy_all

User.create!(username: "user123", password: "password", email: "foo@bar.com")
