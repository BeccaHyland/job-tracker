require 'rails_helper'

describe "user creates new contact" do
  scenario "a user sees a contact form" do
    company = Company.create(name: "ESPN")

    visit company_path(company)

    expect(page).to have_content("Name:")
    expect(page).to have_content("Position:")
    expect(page).to have_content("Email:")
  end
  scenario "a user fills out a contact" do
    company = Company.create(name: "ESPN")
    contact = company.contacts.create(name: "Sally", position: "Hero", email: "hera@gmail.com")

    visit company_path(company)

    fill_in :contact_name, with: "George"
    fill_in :contact_position, with: "President"
    fill_in :contact_email, with: "potus@gmail.com"

    click_on "Save"

    expect(current_path).to eq(company_path(company))
  end
  scenario "a user sees contact added to contacts" do
    company = Company.create(name: "ESPN")
    contact = company.contacts.create(name: "Sally", position: "Hero", email: "hera@gmail.com")

    visit company_path(company)

    fill_in :contact_name, with: "George"
    fill_in :contact_position, with: "President"
    fill_in :contact_email, with: "potus@gmail.com"

    click_on "Save"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("George")
    expect(page).to have_content("President")
    expect(page).to have_content("potus@gmail.com")
  end
end
