require 'rails_helper'

describe "User deletes existing job from the company job index" do
  scenario "a user can delete a company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Finance")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_jobs_path(company)

    within(".job_#{job.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Developer was successfully deleted.")
    expect(current_path).to eq(company_jobs_path(company))
  end
end
