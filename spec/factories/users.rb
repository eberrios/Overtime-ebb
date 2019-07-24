FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user, class: 'User' do
    email     { generate :email }
    password  { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
    first_name  { 'Ernesto' }
    last_name   { 'Berrios' }
    phone       { '5554443330' }
  end

  factory :admin_user, class: 'AdminUser' do
    email     { generate :email }
    password  { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
    first_name { 'Admin' }
    last_name  { 'User' }
    phone       { '5554443330' }
  end

  factory :non_authorizer_user, class: 'User' do
    email     { generate :email }
    password  { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
    first_name  { 'Non' }
    last_name   { 'Authorizer' }
    phone       { '555444333' }
  end
end