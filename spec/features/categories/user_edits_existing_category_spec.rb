require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "Financial")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Fin. Private Sector"
    click_button "Update"

    expect(current_path).to eq(category_path(Category.last.id))
    expect(page).to have_content("Fin. Private Sector")
    expect(page).to_not have_content("Financial")
  end
end
