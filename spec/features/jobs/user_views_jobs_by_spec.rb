require 'rails_helper'

describe 'as a user' do
  describe 'from /jobs?sort=location' do
    it 'shows a page with jobs by location' do
      category = Category.create(title: "Finance")
      company = Company.create(name: "Sears")
      job1 = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
      job2 = company.jobs.create(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)
      job3 = company.jobs.create(title: "SQL", level_of_interest: 70, city: "Denver", category: category)
      location = "Denver"

      visit '/jobs?sort=location'

      expect(page).to have_content("Developer Sears Denver 70 Edit Delete SQL Sears Denver 70 Edit Delete QA Analyst Sears New York City 70 Edit Delete")

    end
  end
end