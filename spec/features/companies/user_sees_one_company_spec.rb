require 'rails_helper'

describe "User sees company show page" do
  scenario "a user sees a company" do
    company = Company.create(name: "ESPN")
    company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Add a New Contact")
    expect(page).to have_content("Existing Contacts")
  end
  scenario "a user sees a contact" do
    company = Company.create(name: "ESPN")
    company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver")
    contact = company.contacts.create(name: "Sally", position: "Hero", email: "hera@gmail.com")

    visit company_path(company)

    expect(page).to have_content("Sally")
    expect(page).to have_content("Hero")
    expect(page).to have_content("hera@gmail.com")
  end

  scenario "a user sees a contact form" do
    company = Company.create(name: "ESPN")
    company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver")
    contact = company.contacts.create(name: "Sally", position: "Hero", email: "hera@gmail.com")

    visit company_path(company)

    expect(page).to have_content("Name:")
    expect(page).to have_content("Position:")
    expect(page).to have_content("Email:")
  end
  scenario "a user fills out a contact" do
    company = Company.create(name: "ESPN")
    company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver")
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
    company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver")
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
  scenario 'user edits contact' do
    company = Company.create(name: "ESPN")
    company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver")
    contact = company.contacts.create(name: "Sally", position: "Hero", email: "hera@gmail.com")

    visit company_path(company)

    click_on 'Edit'

    expect(current_path).to eq(edit_company_contact_path(@company, contact))

  end

end
