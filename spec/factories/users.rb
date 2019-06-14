FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'Ernesto'
    last_name 'Berrios'
  end
  factory :admin_user, class: 'AdminUser' do
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'Admin'
    last_name 'User'
  end
end