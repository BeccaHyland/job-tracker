require 'rails_helper'

describe "User sees all categories" do
  describe "user visits /categories" do
    scenario "a user sees all the categories" do
      c1 = Category.create!(title: "Energy")
      c2 = Category.create!(title: "Medical")

      visit categories_path

      expect(page).to have_link(c1.title)
      expect(page).to have_link(c2.title)
    end

    it 'links to create new category' do
      visit '/categories'
      expect(page).to have_link("Create New Category")
    end

    it "displays edit link for each category" do
      c1 = Category.create!(title: "Energy")
      c2 = Category.create!(title: "Medical")

      visit '/categories'
      expect(page).to have_link("Edit")
    end

    it "displays delete link for each category" do
      c1 = Category.create!(title: "Energy")
      c2 = Category.create!(title: "Medical")

      visit '/categories'
      expect(page).to have_link("Delete")
    end
  end
end
