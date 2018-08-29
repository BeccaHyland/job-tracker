require 'rails_helper'

describe "User sees company show page" do
  scenario "a user sees a company" do

    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Finance")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)

    visit company_path(company)

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Add a New Contact")
    expect(page).to have_content("Existing Contacts")
  end

end
