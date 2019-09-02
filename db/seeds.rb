@user = User.create(email: 'test@test.com',
                    password: '123456789',
                    password_confirmation: '123456789',
                    first_name: 'The',
                    last_name: 'Boss',
                    phone: '1111111100')
puts '1 user created'

AdminUser.create(email: 'admin@admin.com',
                 password: '123456789',
                 password_confirmation: '123456789',
                 first_name: 'The',
                 last_name: 'ADMIN',
                 phone: '1111111100')
puts '1 AdminUser created'

100.times do |post|
  Post.create!(date: Date.today,
               rationale: "#{post} rationale content bla bla blla bla bla b la",
               user_id: @user.id,
               overtime_request: 2.5)
end
puts '100 Posts have been created'

100.times do |audit_log|
  AuditLog.create!(user_id: @user.id,
                   status: 0,
                   start_date: (Date.today - 6.days))

  AuditLog.create!(user_id: @user.id,
                   status: 0,
                   start_date: (Date.today - 13.days))

  AuditLog.create!(user_id: @user.id,
                   status: 0,
                   start_date: (Date.today - 20.days))
end
puts '300 AuditLog have been created'
