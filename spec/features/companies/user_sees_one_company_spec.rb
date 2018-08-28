require 'rails_helper'

describe "User sees company show page" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Add New Contact")
    expect(page).to have_content("Existing Contacts")
  end
  scenario "a user sees a contact" do

  end

  scenario "a user sees a contact form" do

  end
  scenario "a user fills out a contact" do

  end
  scenario "a user sees contact added to contacts" do

  end
  
end
