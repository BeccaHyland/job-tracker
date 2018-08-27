require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end
  scenario "a user sees a link for a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_path(company)

    expect(page).to have_link(job.title)
  end
  scenario "a user clicks on a link for a job to see the job show page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_path(company)

    click_link(job.title)

    expect(page).to have_content("#{job.title}")
  end
end
