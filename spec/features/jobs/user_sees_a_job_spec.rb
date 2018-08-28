require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create(name: "ESPN")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end
  scenario 'user sees a form for a job comment' do
    company = Company.create(name: "ESPN")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver")

    visit job_path(job)

    expect(page).to have_content("Notes")
    expect(page).to have_content("Save")
  end
end
