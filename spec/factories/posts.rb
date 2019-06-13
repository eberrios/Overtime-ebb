FactoryGirl.define do
  factory :post do
    date Date.today
    rationale 'Some rationale FactoryGirl'
    user
  end
  factory :second_post, class: 'Post' do
    date Date.yesterday
    rationale 'Some more content FactoryGirl'
    user
  end
end