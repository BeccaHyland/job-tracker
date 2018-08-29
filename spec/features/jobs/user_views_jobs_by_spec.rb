require 'rails_helper'

describe 'as a user' do
  describe 'from /jobs?sort=location' do
    it 'shows a page with jobs by location' do
      category = Category.create(title: "Finance")
      company = Company.create(name: "Sears")
      job1 = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
      job2 = company.jobs.create(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)
      job3 = company.jobs.create(title: "SQL", level_of_interest: 70, city: "Denver", category: category)

      visit '/jobs?sort=location'

      expect(page).to have_content("#{job1.title} #{company.name} #{job1.city} #{job1.level_of_interest} Edit Delete #{job3.title} #{company.name} #{job3.city} #{job3.level_of_interest} Edit Delete #{job2.title} #{company.name} #{job2.city} #{job2.level_of_interest} Edit Delete")
    end
  end
  describe 'from /jobs?sort=interest' do
    it 'shows a page with jobs by location' do
      category = Category.create(title: "Finance")
      company = Company.create(name: "Sears")
      job1 = company.jobs.create(title: "Developer", level_of_interest: 1, city: "Denver", category: category)
      job2 = company.jobs.create(title: "QA Analyst", level_of_interest: 2, city: "New York City", category: category)
      job3 = company.jobs.create(title: "SQL", level_of_interest: 3, city: "Denver", category: category)

      visit '/jobs?sort=interest'

      expect(page).to have_content("#{job3.title} #{company.name} #{job3.city} #{job3.level_of_interest} Edit Delete #{job2.title} #{company.name} #{job2.city} #{job2.level_of_interest} Edit Delete #{job1.title} #{company.name} #{job1.city} #{job1.level_of_interest} Edit Delete")
    end
  end
end