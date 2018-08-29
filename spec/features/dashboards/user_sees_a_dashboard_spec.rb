require 'rails_helper'

describe "User sees the dashboard" do
  scenario "a user sees jobs by interest" do
    visit dashboard_index_path

  end
  xit "shows top 3 companies by interest" do
    category = Category.create(title: "Technology")
    company1 = Company.create(name: "BestCompany")
    company2 = Company.create(name: "GreatCompany")
    company3 = Company.create(name: "PrettyGoodCompany")
    company4 = Company.create(name: "DecentCompany")
    job1 = company1.jobs.create(title: "Developer", level_of_interest: 5, city: "Denver", category: category)
    job2 = company1.jobs.create(title: "Developer", level_of_interest: 4, city: "Denver", category: category)
    job3 = company2.jobs.create(title: "Developer", level_of_interest: 4, city: "Denver", category: category)
    job4 = company2.jobs.create(title: "Developer", level_of_interest: 3, city: "Denver", category: category)
    job5 = company3.jobs.create(title: "Developer", level_of_interest: 3, city: "Denver", category: category)
    job6 = company3.jobs.create(title: "Developer", level_of_interest: 3, city: "Denver", category: category)
    job7 = company4.jobs.create(title: "Developer", level_of_interest: 3, city: "Denver", category: category)
    job8 = company4.jobs.create(title: "Developer", level_of_interest: 2, city: "Denver", category: category)

    visit dashboard_index_path

    expect(page).to have_content #top company and its starts, repeat below
    expect(page).to_not have_content #the 4th company
  end
  scenario "a user sees jobs listed by location" do

  end
end
