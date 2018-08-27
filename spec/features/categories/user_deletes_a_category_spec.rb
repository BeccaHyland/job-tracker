require 'rails_helper'

describe "User deletes an existing Category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "Energy")
    visit categories_path

    within(".category_#{category.id}") do
      click_link "Delete"
    expect(current_path).to eq(categories_path)
    end

    expect(page).to have_content("Energy was successfully deleted.")
  end
end
