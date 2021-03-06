require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'it can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    it 'has a title of post' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    it "has a new form that can be reached" do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end
    it "can be created from new form page" do
      visit new_post_path
      fill_in 'post[date]', with:Date.today
      fill_in 'post[rationale]', with:"some rationale"

      click_on "Save"
      expect(page).to have_content('some rationale')
    end

  end
end
