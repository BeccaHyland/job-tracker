require 'rails_helper'

describe "User sees one category" do
  it "shows a category" do
    category = Category.create!(title: "Entertainment")

    visit category_path(category)

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Entertainment")
  end

  it "shows all the jobs in one category" do
    category = Category.create!(title: "Entertainment")
    company = Company.create(name: "Denver Aquarium")
    job1 = company.jobs.create(title: "Jr. Developer", level_of_interest: 70, city: "Denver", category: category)
    job2 = company.jobs.create(title: "DBA", level_of_interest: 20, city: "Denver", category: category)

    visit category_path(category)

    expect(current_path).to eq(category_path(category))
    expect(page).to have_link("Jr. Developer")
    expect(page).to have_link("DBA")
  end
end
