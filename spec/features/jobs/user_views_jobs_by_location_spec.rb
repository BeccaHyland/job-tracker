require 'rails_helper'

describe 'as a user' do
  describe 'from a jobs index page a user clicks on a location' do
    it 'shows a page with jobs by location' do
      category = Category.create(title: "Finance")
      company = Company.create(name: "Sears")
      job1 = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
      job2 = company.jobs.create(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)
      job3 = company.jobs.create(title: "SQL", level_of_interest: 70, city: "Denver", category: category)
      location = "Denver"

      visit company_jobs_path(company)

      # click_link "New York"
      #
      # expect(current_path).to eq(job_location_path(location))
      # expect(page).to_not have_content("Developer")
      # expect(page).to_not have_content("SQL")
      # expect(page).to have_content("QA Analyst")

    end
  end
end