@user = User.create(email: "test@test.com", password: "123456789", password_confirmation: "123456789", first_name: "The", last_name: "Boss")
puts "1 user created"


100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"