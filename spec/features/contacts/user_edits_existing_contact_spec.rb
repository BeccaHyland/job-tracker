require 'rails_helper'

describe 'user edits an existing contact' do
  scenario 'user moves to edit contact page' do
    company = Company.create(name: "ESPN")
    contact = company.contacts.create(name: "Sally", position: "Hero", email: "hera@gmail.com")

    visit company_path(company)

    click_on 'Edit'

    expect(current_path).to eq(edit_company_contact_path(company, contact))

  end
  scenario 'user fills in edit contact page and returns to company contact' do
    company = Company.create(name: "ESPN")
    contact = company.contacts.create(name: "Sally", position: "Hero", email: "hera@gmail.com")

    visit edit_company_contact_path(company, contact)

    fill_in :contact_name, with: "George"
    fill_in :contact_position, with: "President"
    fill_in :contact_email, with: "potus@gmail.com"

    click_on "Save"

    expect(current_path).to eq(company_path(company))
  end
end
