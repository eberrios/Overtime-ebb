FactoryBot.define do
  factory :post do
    date      { Date.today }
    rationale { 'Some rationale FactoryBot (post)' }
    overtime_request { 1.5 }
    
    user
  end
  factory :second_post, class: 'Post' do
    date      { Date.yesterday }
    rationale { 'Some more content FactoryBot (second_post)' }
    overtime_request { 0.5 }
    user
  end
end