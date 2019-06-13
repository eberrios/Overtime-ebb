require 'rails_helper'

RSpec.describe Post, type: :model do


 describe "Creation" do

  before do
      @user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Ernesto", last_name: "Berrios")
      login_as(@user, :scope => :user)
      @post = Post.create(date: Date.today, rationale: "Anything", user_id:  @user.id)
  end
    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without a date and rationale" do
      @post.date = nil
      @post.rationale = nil
      @post.user_id = nil
      expect(@post).to_not be_valid
    end 
  end
end
