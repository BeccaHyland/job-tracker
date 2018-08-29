require 'rails_helper'

describe 'user visits company show page' do
  scenario "user sees all company contacts" do
    company1 = Company.create(name: "ESPN")
    company2 = Company.create(name: "CNN")
    contact1 = company1.contacts.create(name: "Sally", position: "Hero", email: "hera@gmail.com")
    contact2 = company1.contacts.create(name: "Jose", position: "Assistant to the Hero", email: "assistant@gmail.com")
    contact3 = company2.contacts.create(name: "Jose", position: "Assistant to the Hero", email: "assistant@gmail.com")

    visit company_path(company1)

    expect(page).to have_content(contact1.name)
    expect(page).to have_content(contact1.position)
    expect(page).to have_content(contact1.email)
    expect(page).to have_content(contact2.name)
    expect(page).to have_content(contact2.position)
    expect(page).to have_content(contact2.email)
    expect(page).to have_content(contact3.name)
    expect(page).to have_content(contact3.position)
    expect(page).to have_content(contact3.email)
  end
end
