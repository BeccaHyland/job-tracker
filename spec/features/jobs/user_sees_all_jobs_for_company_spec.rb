require 'rails_helper'

describe "On company job page" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create(name: "ESPN")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create(title: "QA Analyst", level_of_interest: 70, city: "New York City")

    visit company_jobs_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")

  end
  scenario "a user sees a link for a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_jobs_path(company)

    expect(page).to have_link(job.title)
  end
  scenario "a user clicks on a link for a job to see the job edit page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_jobs_path(company)

    click_link(job.title)

    expect(current_path).to eq(company_job_path(company, job))
  end
end
