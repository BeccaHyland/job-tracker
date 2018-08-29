require 'rails_helper'

describe "User deletes existing contact" do
  scenario "a user can delete a contact" do
    company = Company.create(name: "ESPN")
    category = Category.create!(title: "Finance")
    company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver", category: category)
    contact = company.contacts.create(name: "Sally", position: "Hero", email: "hera@gmail.com")

    visit company_path(company)

    within(".contact_#{contact.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("was successfully deleted.")
    expect(current_path).to eq(company_path(company))
  end
end
