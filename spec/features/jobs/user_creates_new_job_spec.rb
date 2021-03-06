require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create(name: "ESPN")
    category1 = Category.create(title: "Finance")
    category2 = Category.create(title: "Education")

    visit new_company_job_path(company)

    select category1.title, from: "job[category_id]"
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Create Job"

    expect(current_path).to eq(company_job_path(company, Job.last))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
