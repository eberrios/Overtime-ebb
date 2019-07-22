FactoryBot.define do
  factory :post do
    date      { Date.today }
    rationale { 'Some rationale FactoryBot (post)' }
    user
  end
  factory :second_post, class: 'Post' do
    date      { Date.yesterday }
    rationale { 'Some more content FactoryBot (second_post)' }
    user
  end
end