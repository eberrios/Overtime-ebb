require 'rails_helper'

describe 'navigate' do
  describe "Index" do
    it "can be reached successfully" do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it "has a tittle of Posts" do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end
end