require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    c1 = Category.create!(title: "Junior Dev")
    c2 = Category.create!(title: "Senior Dev")

    visit categories_path

    expect(page).to have_content("Junior Dev")
  end
end
