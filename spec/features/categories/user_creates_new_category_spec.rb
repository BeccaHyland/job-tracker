require 'rails_helper'

describe 'user creates a new category' do
  describe 'they link from the categories index' do
    describe 'they fill in a title' do
      it 'creates a new category' do
        visit categories_path
        click_link "Create New Category"

        expect(current_path).to eq(new_category_path)

        fill_in "category[title]", with: "New Test Category"
        click_on "Create Category"

        expect(page).to have_content("New Test Category")
      end
    end
  end
end
