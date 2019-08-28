require 'rails_helper'

describe 'Homepage' do 
  before do
    @admin_user = FactoryBot.create(:admin_user)
    login_as(@admin_user, scope: :user)
  end 

  it 'allows the admin to appprove posts the form homepage' do
    @post = FactoryBot.create(:post)
    visit root_path
    click_on("approve_#{@post.id}")

    expect(@post.reload.status).to eq ('approved')
  end
end