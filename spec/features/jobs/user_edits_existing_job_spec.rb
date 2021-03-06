require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Finance")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit edit_company_job_path(company, job)
    fill_in "job[title]", with: "Junior Dev"
    #other updates...interest?
    click_button "Update"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Junior Dev")
    expect(page).to_not have_content("Developer")
  end
end
