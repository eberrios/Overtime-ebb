require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryBot.create(:user) }
  
  let(:post) do
    Post.create(date: Date.today, rationale: 'rationale let', user_id: user.id, overtime_request: 3.5)
  end

  before do
    login_as(user, :scope => :user)
  end

  describe 'Index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a list of post' do
      post1 = FactoryBot.create(:post)
      post2 = FactoryBot.create(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end

    it 'has a scope so that only post creators can see their posts' do
      other_user = User.create(first_name: 'Non', last_name:'Authorized', email: 'nonauth@example.com', password:'asdfasdf', password_confirmation:'asdfasdf')
      post_from_other_user = Post.create(date: Date.today, rationale: "This post shouldn't be seen", user_id: other_user.id, overtime_request: 3.5)
      visit posts_path
      expect(page).to_not have_content(/This post shouldn't be seen/)
    end
  end

  describe 'new' do
    it 'new post in homepage' do
      visit root_path
      click_link 'new_post_from_nav'
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)
      delete_user = FactoryBot.create(:user)
      login_as(delete_user, :scope => :user)

      post_to_delete = Post.create(date: Date.today, rationale: 'delete_post', user_id: delete_user.id, overtime_request: 3.5)
      
      visit posts_path
      click_link "delete_post_#{post_to_delete.id}_from_index"
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      fill_in 'post[overtime_request]', with: 3.3
      expect { click_on 'Save' }.to change(Post, :count).by(1)
      #expect(page).to have_content('Some rationale')
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'
      fill_in 'post[overtime_request]', with: 3.6
      click_on 'Save'
      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited contect'
      click_on 'Save'

      expect(page).to have_content('Edited contect')
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorizer_user = FactoryBot.create(:non_authorizer_user)
      login_as(non_authorizer_user, :scope => :user)

      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end
end
