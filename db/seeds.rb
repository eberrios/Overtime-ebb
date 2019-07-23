@user = User.create(email: 'test@test.com',
                    password: '123456789',
                    password_confirmation: '123456789',
                    first_name: 'The',
                    last_name: 'Boss',
                    phone: '11111111')
puts '1 user created'

AdminUser.create(email: 'admin@admin.com',
                 password: '123456789',
                 password_confirmation: '123456789',
                 first_name: 'The',
                 last_name: 'ADMIN',
                 phone: '11111111')
puts '1 AdminUser created'

100.times do |post|
  Post.create!(date: Date.today,
               rationale: "#{post} rationale content",
               user_id: @user.id,
               overtime_request: 2.5)
end
puts '100 Posts have been created'
