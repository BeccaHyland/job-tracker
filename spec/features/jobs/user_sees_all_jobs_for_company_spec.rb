require 'rails_helper'

describe "On company job page" do
  it "a user sees all the jobs for a specific company" do
    company = Company.create(name: "ESPN")
    category = Category.create!(title: "Finance")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    job2 = company.jobs.create(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)

    visit company_jobs_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_link(job.title)
    expect(page).to have_link(job2.title)

  end
  scenario "a user sees a link for a job" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Finance")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_jobs_path(company)

    expect(page).to have_link(job.title)
  end
  scenario "a user clicks on a link for a job to see the job edit page" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Finance")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_jobs_path(company)

    click_link(job.title)

    expect(current_path).to eq(company_job_path(company, job))
  end
end
